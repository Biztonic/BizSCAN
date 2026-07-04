import '../../../../core/errors/result.dart';
import '../models/report_pdf.dart';
import '../repositories/report_repository.dart';

class GenerateReportMetadata {
  final ReportRepository repository;

  GenerateReportMetadata(this.repository);

  Future<Result<ReportPdf>> call(ReportPdf report) {
    return repository.saveReportMetadata(report);
  }
}
