import '../../../../core/errors/result.dart';
import '../models/live_pid.dart';
import '../repositories/pid_repository.dart';

class SavePid {
  final PidRepository repository;

  SavePid(this.repository);

  Future<Result<LivePid>> call(String scanId, LivePid pid) {
    return repository.savePid(scanId, pid);
  }
}
