import '../../../../core/errors/result.dart';
import '../models/sync_log.dart';

abstract class SyncRepository {
  Future<Result<void>> syncAll();
  Future<Result<List<Map<String, dynamic>>>> getPendingQueue();
  Future<Result<void>> processQueue();
  Future<Result<List<SyncLog>>> getSyncLogs();
  Future<Result<List<ConflictLog>>> getConflictLogs();
  Future<Result<void>> logConflict(ConflictLog conflict);
}
