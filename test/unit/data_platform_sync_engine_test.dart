import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bizscan/core/errors/failures.dart';
import 'package:bizscan/core/errors/result.dart';
import 'package:bizscan/core/services/firestore_service.dart';
import 'package:bizscan/core/services/logging_service.dart';
import 'package:bizscan/core/sync/data/repositories/sync_repository_impl.dart';

class MockFirestoreService extends Mock implements FirestoreService {}
class MockLoggingService extends Mock implements LoggingService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late MockFirestoreService mockFirestore;
  late MockLoggingService mockLogger;

  late Box<String> syncQueueBox;
  late Box<String> syncLogBox;
  late Box<String> conflictLogBox;
  late SyncRepositoryImpl syncRepository;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_sync_tests_');
    Hive.init(tempDir.path);

    mockFirestore = MockFirestoreService();
    mockLogger = MockLoggingService();

    syncQueueBox = await Hive.openBox<String>('sync_queue');
    syncLogBox = await Hive.openBox<String>('sync_logs');
    conflictLogBox = await Hive.openBox<String>('conflict_logs');

    syncRepository = SyncRepositoryImpl(
      syncQueueBox,
      syncLogBox,
      conflictLogBox,
      mockFirestore,
      mockLogger,
    );
  });

  tearDown(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('SyncEngine Queue Processing & Conflict Resolutions', () {
    test('processQueue should successfully push local creations to Firestore and empty queue', () async {
      final queueItem = {
        'id': 'v100',
        'type': 'vehicle',
        'action': 'create',
        'data': {'vehicleId': 'v100', 'nickname': 'Storm'},
        'timestamp': DateTime.now().toIso8601String(),
      };
      await syncQueueBox.put('vehicle_v100', json.encode(queueItem));

      // Mock Firestore success
      when(() => mockFirestore.getDocument('vehicles', 'v100'))
          .thenAnswer((_) async => const Result.success(null));
      when(() => mockFirestore.setDocument('vehicles', 'v100', any()))
          .thenAnswer((_) async => const Result.success(null));

      final result = await syncRepository.processQueue();
      expect(result.isSuccess, true);

      // Queue item should be deleted
      expect(syncQueueBox.containsKey('vehicle_v100'), false);

      // Audit log should be written
      final logs = await syncRepository.getSyncLogs();
      expect(logs.getOrNull?.length, 1);
      expect(logs.getOrNull?.first.entityId, 'v100');
      expect(logs.getOrNull?.first.status, 'success');
    });

    test('processQueue should detect conflict and apply Last-Write-Wins (overwriting local with cloud if cloud is newer)', () async {
      final localTime = DateTime.now().subtract(const Duration(hours: 2));
      final cloudTime = DateTime.now().subtract(const Duration(hours: 1)); // Cloud is newer!

      final queueItem = {
        'id': 'v100',
        'type': 'vehicle',
        'action': 'update',
        'data': {
          'vehicleId': 'v100',
          'nickname': 'Safari Local',
          'updatedAt': localTime.toIso8601String(),
        },
        'timestamp': DateTime.now().toIso8601String(),
      };
      await syncQueueBox.put('vehicle_v100', json.encode(queueItem));

      final cloudDoc = {
        'vehicleId': 'v100',
        'nickname': 'Safari Cloud Newer',
        'updatedAt': cloudTime.toIso8601String(),
      };

      // Mock Firestore returning a newer document in cloud
      when(() => mockFirestore.getDocument('vehicles', 'v100'))
          .thenAnswer((_) async => Result.success(cloudDoc));

      final result = await syncRepository.processQueue();
      expect(result.isSuccess, true);

      // Local queue item removed since it is overwritten/resolved
      expect(syncQueueBox.containsKey('vehicle_v100'), false);

      // Conflict should be logged in database
      final conflicts = await syncRepository.getConflictLogs();
      expect(conflicts.getOrNull?.length, 1);
      expect(conflicts.getOrNull?.first.entityId, 'v100');
      expect(conflicts.getOrNull?.first.resolutionStrategy, contains('last_write_wins'));
    });

    test('processQueue should halt and keep items in queue on connection errors', () async {
      final queueItem = {
        'id': 'v100',
        'type': 'vehicle',
        'action': 'create',
        'data': {'vehicleId': 'v100'},
        'timestamp': DateTime.now().toIso8601String(),
      };
      await syncQueueBox.put('vehicle_v100', json.encode(queueItem));

      // Mock Firestore failure (network failure) for both get and set actions
      when(() => mockFirestore.getDocument('vehicles', 'v100'))
          .thenAnswer((_) async => const Result.failure(ServerFailure('Connection lost')));
      when(() => mockFirestore.setDocument('vehicles', 'v100', any()))
          .thenAnswer((_) async => const Result.failure(ServerFailure('Connection lost')));

      final result = await syncRepository.processQueue();
      // Should not throw, but halt processing loop gracefully
      expect(result.isSuccess, true);

      // Queue item should remain in local queue for retry
      expect(syncQueueBox.containsKey('vehicle_v100'), true);
    });
  });
}
