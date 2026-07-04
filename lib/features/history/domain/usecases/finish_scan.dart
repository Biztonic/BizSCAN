import '../../../../core/errors/result.dart';
import '../models/scan_session.dart';
import '../repositories/scan_repository.dart';

class FinishScan {
  final ScanRepository repository;

  FinishScan(this.repository);

  Future<Result<ScanSession>> call(ScanSession scan, {required DateTime completedAt, required int duration}) {
    final updated = scan.copyWith(
      completedAt: completedAt,
      scanDuration: duration,
    );
    return repository.updateScan(updated);
  }
}
