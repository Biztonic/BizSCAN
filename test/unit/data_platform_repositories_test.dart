import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bizscan/core/services/firestore_service.dart';
import 'package:bizscan/core/services/logging_service.dart';
import 'package:bizscan/features/vehicle/domain/models/vehicle.dart';
import 'package:bizscan/features/vehicle/data/repositories/vehicle_repository_impl.dart';
import 'package:bizscan/features/history/domain/models/scan_session.dart';
import 'package:bizscan/features/history/data/repositories/scan_repository_impl.dart';
import 'package:bizscan/features/health/domain/models/health_report.dart';
import 'package:bizscan/features/health/data/repositories/health_repository_impl.dart';
import 'package:bizscan/features/obd/domain/models/live_pid.dart';
import 'package:bizscan/features/obd/data/repositories/pid_repository_impl.dart';
import 'package:bizscan/features/settings/domain/models/settings_model.dart';
import 'package:bizscan/features/settings/data/repositories/settings_repository_impl.dart';

class MockFirestoreService extends Mock implements FirestoreService {}
class MockLoggingService extends Mock implements LoggingService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  late Directory tempDir;
  late MockFirestoreService mockFirestore;
  late MockLoggingService mockLogger;

  late Box<String> vehicleBox;
  late Box<String> scanBox;
  late Box<String> reportBox;
  late Box<String> pidBox;
  late Box<String> settingsBox;
  late Box<String> syncQueueBox;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_bizscan_tests_');
    Hive.init(tempDir.path);

    mockFirestore = MockFirestoreService();
    mockLogger = MockLoggingService();

    vehicleBox = await Hive.openBox<String>('vehicles');
    scanBox = await Hive.openBox<String>('scans');
    reportBox = await Hive.openBox<String>('health_reports');
    pidBox = await Hive.openBox<String>('live_pids');
    settingsBox = await Hive.openBox<String>('settings');
    syncQueueBox = await Hive.openBox<String>('sync_queue');
  });

  tearDown(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('VehicleRepositoryImpl Tests', () {
    test('createVehicle should save locally and write to queue', () async {
      final repo = VehicleRepositoryImpl(vehicleBox, syncQueueBox, mockFirestore, mockLogger);
      final vehicle = Vehicle(
        vehicleId: 'v1',
        ownerId: 'u1',
        nickname: 'Safari',
        manufacturer: 'Tata',
        model: 'Safari',
        year: 2024,
        fuelType: 'diesel',
        engineCapacity: 2.0,
        vin: 'VIN123456789TataS',
        registrationNumber: 'MH12XX9999',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final result = await repo.createVehicle(vehicle);
      expect(result.isSuccess, true);
      
      // Verify stored locally
      final cached = vehicleBox.get('v1');
      expect(cached, isNotNull);
      expect(json.decode(cached!)['nickname'], 'Safari');

      // Verify sync queue has write item
      expect(syncQueueBox.containsKey('vehicle_v1'), true);
    });

    test('searchVehicles should filter locally by model, manufacturer, and VIN', () async {
      final repo = VehicleRepositoryImpl(vehicleBox, syncQueueBox, mockFirestore, mockLogger);
      final v1 = Vehicle(
        vehicleId: 'v1',
        ownerId: 'u1',
        nickname: 'Harrier',
        manufacturer: 'Tata',
        model: 'Harrier',
        year: 2023,
        fuelType: 'diesel',
        engineCapacity: 2.0,
        vin: 'VIN_HARRIER_TATA1',
        registrationNumber: 'MH12XX8888',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final v2 = Vehicle(
        vehicleId: 'v2',
        ownerId: 'u1',
        nickname: 'Thar',
        manufacturer: 'Mahindra',
        model: 'Thar',
        year: 2022,
        fuelType: 'petrol',
        engineCapacity: 2.0,
        vin: 'VIN_THAR_MAHINDRA',
        registrationNumber: 'MH14YY7777',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repo.createVehicle(v1);
      await repo.createVehicle(v2);

      final search1 = await repo.searchVehicles(query: 'tata');
      expect(search1.getOrNull?.length, 1);
      expect(search1.getOrNull?.first.nickname, 'Harrier');

      final search2 = await repo.searchVehicles(vin: 'thar');
      expect(search2.getOrNull?.length, 1);
      expect(search2.getOrNull?.first.nickname, 'Thar');
    });

    test('watchVehicles should stream active list updates', () async {
      final repo = VehicleRepositoryImpl(vehicleBox, syncQueueBox, mockFirestore, mockLogger);
      final v1 = Vehicle(
        vehicleId: 'v1',
        ownerId: 'u1',
        nickname: 'Safari',
        manufacturer: 'Tata',
        model: 'Safari',
        year: 2024,
        fuelType: 'diesel',
        engineCapacity: 2.0,
        vin: 'VIN_SAFARI_1',
        registrationNumber: 'MH12XX9999',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final stream = repo.watchVehicles();
      final expectLaterFuture = expectLater(
        stream,
        emitsInOrder([
          isEmpty,
          hasLength(1),
        ]),
      );

      await Future.delayed(Duration.zero); // Let stream yield its initial empty state first
      await repo.createVehicle(v1);
      await expectLaterFuture;
    });
  });

  group('ScanRepositoryImpl Tests', () {
    test('createScan and searchScans date ranges', () async {
      final repo = ScanRepositoryImpl(scanBox, syncQueueBox, mockFirestore, mockLogger);
      final s1 = ScanSession(
        scanId: 's1',
        vehicleId: 'v1',
        userId: 'u1',
        startedAt: DateTime.now().subtract(const Duration(days: 2)),
        connectionType: 'bluetooth',
        protocol: 'CAN',
        scanDuration: 120,
        appVersion: '1.0.0',
        isSynced: false,
      );

      await repo.createScan(s1);

      final resultAll = await repo.searchScans();
      expect(resultAll.getOrNull?.length, 1);

      // Search after yesterday should find 0 scans
      final resultAfter = await repo.searchScans(startDate: DateTime.now().subtract(const Duration(days: 1)));
      expect(resultAfter.getOrNull, isEmpty);
    });
  });

  group('HealthRepositoryImpl Tests', () {
    test('saveHealthReport and search score bounds', () async {
      final repo = HealthRepositoryImpl(reportBox, syncQueueBox, mockFirestore, mockLogger);
      final report = HealthReport(
        reportId: 'rep1',
        scanId: 's1',
        overallScore: 85,
        engineScore: 88,
        batteryScore: 82,
        coolingScore: 84,
        fuelScore: 87,
        emissionScore: 86,
        recommendations: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repo.saveHealthReport(report);

      final matchScore = await repo.searchReports(minScore: 80, maxScore: 90);
      expect(matchScore.getOrNull?.length, 1);

      final missScore = await repo.searchReports(minScore: 90);
      expect(missScore.getOrNull, isEmpty);
    });
  });

  group('PidRepositoryImpl Tests', () {
    test('savePid and watch PIDs for specific scan session prefix', () async {
      final repo = PidRepositoryImpl(pidBox, syncQueueBox, mockFirestore, mockLogger);
      final pid1 = LivePid(
        pid: '0C',
        name: 'RPM',
        value: 800.0,
        unit: 'RPM',
        timestamp: DateTime.now(),
        isSupported: true,
      );
      final pid2 = LivePid(
        pid: '0D',
        name: 'Speed',
        value: 40.0,
        unit: 'km/h',
        timestamp: DateTime.now(),
        isSupported: true,
      );

      await repo.savePid('scanA', pid1);
      await repo.savePid('scanB', pid2);

      final scanAPids = await repo.getPidsForScan('scanA');
      expect(scanAPids.getOrNull?.length, 1);
      expect(scanAPids.getOrNull?.first.name, 'RPM');
    });
  });

  group('SettingsRepositoryImpl Tests', () {
    test('getSettings should load defaults first time', () async {
      final repo = SettingsRepositoryImpl(settingsBox, syncQueueBox, mockFirestore, mockLogger);
      final result = await repo.getSettings();
      expect(result.isSuccess, true);
      expect(result.getOrNull?.language, 'en');
      expect(result.getOrNull?.theme, 'system');
    });

    test('saveSettings should update settings locally and queue updates', () async {
      final repo = SettingsRepositoryImpl(settingsBox, syncQueueBox, mockFirestore, mockLogger);
      const update = SettingsModel(
        language: 'hi',
        theme: 'dark',
        distanceUnit: 'metric',
        temperatureUnit: 'celsius',
        fuelUnit: 'liters',
        notifications: true,
      );

      final result = await repo.saveSettings(update);
      expect(result.isSuccess, true);

      final loaded = await repo.getSettings();
      expect(loaded.getOrNull?.language, 'hi');
      expect(loaded.getOrNull?.theme, 'dark');

      expect(syncQueueBox.containsKey('settings_user_settings'), true);
    });
  });
}
