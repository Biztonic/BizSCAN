import '../../../../core/errors/result.dart';
import '../models/scan_session.dart';

abstract class ScanRepository {
  Future<Result<ScanSession>> createScan(ScanSession scan);
  Future<Result<ScanSession>> updateScan(ScanSession scan);
  Future<Result<ScanSession?>> getScan(String scanId);
  Stream<List<ScanSession>> watchHistory();
  Future<Result<List<ScanSession>>> searchScans({
    String? vehicleId,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<Result<void>> syncScans();
}
