import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_log.freezed.dart';
part 'sync_log.g.dart';

@freezed
class SyncLog with _$SyncLog {
  const factory SyncLog({
    required String logId,
    required String entityType,
    required String entityId,
    required String actionType, // create, update, delete
    required DateTime timestamp,
    required String status, // success, failed
    String? errorMessage,
  }) = _SyncLog;

  factory SyncLog.fromJson(Map<String, dynamic> json) => _$SyncLogFromJson(json);
}

@freezed
class ConflictLog with _$ConflictLog {
  const factory ConflictLog({
    required String conflictId,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localVersion,
    required Map<String, dynamic> cloudVersion,
    required Map<String, dynamic> resolvedVersion,
    required DateTime timestamp,
    required String resolutionStrategy, // last_write_wins, manual
  }) = _ConflictLog;

  factory ConflictLog.fromJson(Map<String, dynamic> json) => _$ConflictLogFromJson(json);
}
