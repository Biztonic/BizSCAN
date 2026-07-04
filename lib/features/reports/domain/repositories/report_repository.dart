import '../../../../core/errors/result.dart';
import '../models/diagnostic_report.dart';
import '../models/report_pdf.dart';
import '../models/report_template.dart';

abstract class ReportRepository {
  Future<void> saveReport(DiagnosticReport report);
  Future<DiagnosticReport?> getReport(String reportId);
  Future<List<DiagnosticReport>> getAllReports();
  Future<void> deleteReport(String reportId);

  Future<void> saveTemplate(ReportTemplate template);
  Future<List<ReportTemplate>> getTemplates();

  Future<void> saveExportRecord(String exportId, String payload);
  Future<Result<ReportPdf>> saveReportMetadata(ReportPdf reportPdf);
}
