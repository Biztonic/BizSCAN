import '../../../../core/errors/result.dart';
import '../models/health_report.dart';

abstract class HealthRepository {
  Future<Result<HealthReport>> saveHealthReport(HealthReport report);
  Future<Result<HealthReport?>> getHealthReport(String reportId);
  Future<Result<HealthReport?>> getHealthReportByScan(String scanId);
  Stream<List<HealthReport>> watchHealthReports();
  Future<Result<List<HealthReport>>> searchReports({
    int? minScore,
    int? maxScore,
  });
  Future<Result<void>> syncReports();
  Future<Result<String>> analyzeVehicleHealth(List<String> dtcs, Map<String, double> sensorData);
}
