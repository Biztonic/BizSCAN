import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/live_pid.dart';
import '../../domain/repositories/pid_repository.dart';

class PidRepositoryImpl implements PidRepository {
  final Box<String> _pidBox;
  final Box<String> _syncQueueBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  PidRepositoryImpl(
    this._pidBox,
    this._syncQueueBox,
    this._firestoreService,
    this._logger,
  );

  List<LivePid> _readPidsForScan(String scanId) {
    final list = <LivePid>[];
    final prefix = '${scanId}_';
    for (final key in _pidBox.keys) {
      if (key is String && key.startsWith(prefix)) {
        final jsonStr = _pidBox.get(key);
        if (jsonStr != null) {
          try {
            list.add(LivePid.fromJson(json.decode(jsonStr)));
          } catch (e) {
            _logger.error('Error deserializing cached pid: $e');
          }
        }
      }
    }
    list.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return list;
  }

  @override
  Future<Result<LivePid>> savePid(String scanId, LivePid pid) async {
    try {
      final key = '${scanId}_${pid.pid}';
      final jsonStr = json.encode(pid.toJson());
      await _pidBox.put(key, jsonStr);

      final queueItem = {
        'id': key,
        'type': 'live_pid',
        'action': 'create',
        'data': {
          'scanId': scanId,
          ...pid.toJson(),
        },
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('pid_$key', json.encode(queueItem));

      return Result.success(pid);
    } catch (e) {
      return Result.failure(CacheFailure('Local write failed: $e'));
    }
  }

  @override
  Future<Result<List<LivePid>>> getPidsForScan(String scanId) async {
    try {
      final list = _readPidsForScan(scanId);
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Local read failed: $e'));
    }
  }

  @override
  Stream<List<LivePid>> watchPidsForScan(String scanId) async* {
    yield _readPidsForScan(scanId);
    await for (final _ in _pidBox.watch()) {
      yield _readPidsForScan(scanId);
    }
  }

  @override
  Future<Result<void>> syncPids(String scanId) async {
    try {
      final result = await _firestoreService.getCollection('live_pids');
      if (result.isSuccess) {
        final cloudDocs = result.getOrNull ?? [];
        for (final doc in cloudDocs) {
          if (doc['scanId'] == scanId) {
            final pid = LivePid.fromJson(doc);
            final key = '${scanId}_${pid.pid}';
            if (!_syncQueueBox.containsKey('pid_$key')) {
              await _pidBox.put(key, json.encode(pid.toJson()));
            }
          }
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync PIDs failed: $e'));
    }
  }
}
