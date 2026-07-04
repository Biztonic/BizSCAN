import '../../../../core/errors/result.dart';
import '../models/live_pid.dart';

abstract class PidRepository {
  Future<Result<LivePid>> savePid(String scanId, LivePid pid);
  Future<Result<List<LivePid>>> getPidsForScan(String scanId);
  Stream<List<LivePid>> watchPidsForScan(String scanId);
  Future<Result<void>> syncPids(String scanId);
}
