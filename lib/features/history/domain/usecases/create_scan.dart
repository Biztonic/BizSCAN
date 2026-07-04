import '../../../../core/errors/result.dart';
import '../models/scan_session.dart';
import '../repositories/scan_repository.dart';

class CreateScan {
  final ScanRepository repository;

  CreateScan(this.repository);

  Future<Result<ScanSession>> call(ScanSession scan) {
    return repository.createScan(scan);
  }
}
