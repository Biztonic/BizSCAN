import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/models/diagnostic_report.dart';
import '../../domain/models/report_template.dart';
import '../../domain/repositories/report_repository.dart';
import '../../domain/services/csv_exporter.dart';
import '../../domain/services/digital_signature_engine.dart';
import '../../domain/services/html_generator.dart';
import '../../domain/services/json_exporter.dart';
import '../../domain/services/pdf_generator.dart';
import '../../domain/services/qr_verification_engine.dart';
import '../../domain/services/report_builder_engine.dart';
import '../../domain/services/report_template_engine.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return sl<ReportRepository>();
});

final reportBuilderEngineProvider = Provider<ReportBuilderEngine>((ref) {
  return sl<ReportBuilderEngine>();
});

final pdfGeneratorProvider = Provider<PDFGenerator>((ref) {
  return sl<PDFGenerator>();
});

final htmlGeneratorProvider = Provider<HTMLGenerator>((ref) {
  return sl<HTMLGenerator>();
});

final csvExporterProvider = Provider<CSVExporter>((ref) {
  return sl<CSVExporter>();
});

final jsonExporterProvider = Provider<JSONExporter>((ref) {
  return sl<JSONExporter>();
});

final qrVerificationEngineProvider = Provider<QRVerificationEngine>((ref) {
  return sl<QRVerificationEngine>();
});

final digitalSignatureEngineProvider = Provider<DigitalSignatureEngine>((ref) {
  return sl<DigitalSignatureEngine>();
});

final allReportsProvider = FutureProvider<List<DiagnosticReport>>((ref) async {
  final repo = ref.watch(reportRepositoryProvider);
  return repo.getAllReports();
});

final templateProvider = Provider<List<ReportTemplate>>((ref) {
  return ReportTemplateEngine().getStandardTemplates();
});
