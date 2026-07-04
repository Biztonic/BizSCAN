import '../../../../core/errors/result.dart';
import '../repositories/sync_repository.dart';

class SyncNow {
  final SyncRepository repository;

  SyncNow(this.repository);

  Future<Result<void>> call() {
    return repository.syncAll();
  }
}
