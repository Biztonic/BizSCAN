import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/sync_log.dart';
import '../../domain/repositories/sync_repository.dart';

class SyncRepositoryImpl implements SyncRepository {
  final Box<String> _syncQueueBox;
  final Box<String> _syncLogBox;
  final Box<String> _conflictLogBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  SyncRepositoryImpl(
    this._syncQueueBox,
    this._syncLogBox,
    this._conflictLogBox,
    this._firestoreService,
    this._logger,
  );

  @override
  Future<Result<void>> syncAll() async {
    try {
      await processQueue();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync all failed: $e'));
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>>> getPendingQueue() async {
    try {
      final list = <Map<String, dynamic>>[];
      for (final key in _syncQueueBox.keys) {
        final jsonStr = _syncQueueBox.get(key);
        if (jsonStr != null) {
          list.add(Map<String, dynamic>.from(json.decode(jsonStr)));
        }
      }
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Read queue failed: $e'));
    }
  }

  @override
  Future<Result<void>> processQueue() async {
    try {
      final queueItems = await getPendingQueue();
      if (queueItems.isFailure) {
        return Result.failure(queueItems.failureOrNull!);
      }

      final items = queueItems.getOrNull ?? [];
      for (final item in items) {
        final String queueKey = _syncQueueBox.keys.firstWhere(
          (k) => _syncQueueBox.get(k) != null && json.decode(_syncQueueBox.get(k)!)['id'] == item['id'],
          orElse: () => '',
        ) as String;

        if (queueKey.isEmpty) {
          continue;
        }

        final id = item['id'] as String;
        final type = item['type'] as String;
        final action = item['action'] as String;
        final data = item['data'] as Map<String, dynamic>?;

        Result<void> result;
        
        String collectionPath = '';
        if (type == 'vehicle') {
          collectionPath = 'vehicles';
        } else if (type == 'scan_session') {
          collectionPath = 'scan_sessions';
        } else if (type == 'health_report') {
          collectionPath = 'health_reports';
        } else if (type == 'live_pid') {
          collectionPath = 'live_pids';
        } else if (type == 'pdf_report') {
          collectionPath = 'pdf_reports';
        } else if (type == 'user_settings') {
          collectionPath = 'user_settings';
        }

        if (collectionPath.isEmpty) {
          continue;
        }

        if (action == 'create' || action == 'update') {
          final cloudCheck = await _firestoreService.getDocument(collectionPath, id);
          if (cloudCheck.isSuccess && cloudCheck.getOrNull != null) {
            final cloudData = cloudCheck.getOrNull!;
            final cloudUpdatedStr = cloudData['updatedAt'] ?? cloudData['timestamp'] ?? cloudData['startedAt'];
            final localUpdatedStr = data?['updatedAt'] ?? data?['timestamp'] ?? data?['startedAt'];

            if (cloudUpdatedStr != null && localUpdatedStr != null) {
              final cloudTime = DateTime.tryParse(cloudUpdatedStr) ?? DateTime.now();
              final localTime = DateTime.tryParse(localUpdatedStr) ?? DateTime.now();
              
              if (cloudTime.isAfter(localTime)) {
                final conflict = ConflictLog(
                  conflictId: DateTime.now().millisecondsSinceEpoch.toString(),
                  entityType: type,
                  entityId: id,
                  localVersion: data ?? {},
                  cloudVersion: cloudData,
                  resolvedVersion: cloudData,
                  timestamp: DateTime.now(),
                  resolutionStrategy: 'last_write_wins (cloud overwritten)',
                );
                await logConflict(conflict);
                await _syncQueueBox.delete(queueKey);
                continue;
              }
            }
          }

          result = await _firestoreService.setDocument(collectionPath, id, data ?? {});
        } else if (action == 'delete') {
          result = await _firestoreService.deleteDocument(collectionPath, id);
        } else {
          result = const Result.success(null);
        }

        if (result.isSuccess) {
          final audit = SyncLog(
            logId: DateTime.now().millisecondsSinceEpoch.toString(),
            entityType: type,
            entityId: id,
            actionType: action,
            timestamp: DateTime.now(),
            status: 'success',
          );
          await _syncLogBox.put(audit.logId, json.encode(audit.toJson()));
          await _syncQueueBox.delete(queueKey);
        } else {
          _logger.warning('Failed to sync queue item $id: ${result.failureOrNull?.message}');
          break;
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Queue processing error: $e'));
    }
  }

  @override
  Future<Result<List<SyncLog>>> getSyncLogs() async {
    try {
      final list = <SyncLog>[];
      for (final key in _syncLogBox.keys) {
        final jsonStr = _syncLogBox.get(key);
        if (jsonStr != null) {
          list.add(SyncLog.fromJson(json.decode(jsonStr)));
        }
      }
      list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Read sync logs failed: $e'));
    }
  }

  @override
  Future<Result<List<ConflictLog>>> getConflictLogs() async {
    try {
      final list = <ConflictLog>[];
      for (final key in _conflictLogBox.keys) {
        final jsonStr = _conflictLogBox.get(key);
        if (jsonStr != null) {
          list.add(ConflictLog.fromJson(json.decode(jsonStr)));
        }
      }
      list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return Result.success(list);
    } catch (e) {
      return Result.failure(CacheFailure('Read conflict logs failed: $e'));
    }
  }

  @override
  Future<Result<void>> logConflict(ConflictLog conflict) async {
    try {
      await _conflictLogBox.put(conflict.conflictId, json.encode(conflict.toJson()));
      await _firestoreService.setDocument('sync_logs', conflict.conflictId, conflict.toJson());
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CacheFailure('Log conflict failed: $e'));
    }
  }
}
