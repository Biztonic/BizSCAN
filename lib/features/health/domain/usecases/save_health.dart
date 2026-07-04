import '../../../../core/errors/result.dart';
import '../models/health_report.dart';
import '../repositories/health_repository.dart';

class SaveHealth {
  final HealthRepository repository;

  SaveHealth(this.repository);

  Future<Result<HealthReport>> call(HealthReport report) {
    return repository.saveHealthReport(report);
  }
}
