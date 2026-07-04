import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/diagnostic_report.dart';
import '../../domain/models/report_pdf.dart';
import '../../domain/models/report_template.dart';
import '../../domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final Box<String> _reportBox;
  final Box<String> _templateBox;
  final Box<String> _exportBox;

  ReportRepositoryImpl(
    this._reportBox,
    this._templateBox,
    this._exportBox,
  );

  @override
  Future<void> saveReport(DiagnosticReport report) async {
    await _reportBox.put(report.reportId, jsonEncode(report.toJson()));
  }

  @override
  Future<DiagnosticReport?> getReport(String reportId) async {
    final raw = _reportBox.get(reportId);
    if (raw == null) return null;
    try {
      return DiagnosticReport.fromJson(jsonDecode(raw));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<DiagnosticReport>> getAllReports() async {
    final list = <DiagnosticReport>[];
    for (final raw in _reportBox.values) {
      try {
        list.add(DiagnosticReport.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    return list;
  }

  @override
  Future<void> deleteReport(String reportId) async {
    await _reportBox.delete(reportId);
  }

  @override
  Future<void> saveTemplate(ReportTemplate template) async {
    await _templateBox.put(template.templateId, jsonEncode(template.toJson()));
  }

  @override
  Future<List<ReportTemplate>> getTemplates() async {
    final list = <ReportTemplate>[];
    for (final raw in _templateBox.values) {
      try {
        list.add(ReportTemplate.fromJson(jsonDecode(raw)));
      } catch (_) {}
    }
    return list;
  }

  @override
  Future<void> saveExportRecord(String exportId, String payload) async {
    await _exportBox.put(exportId, payload);
  }

  @override
  Future<Result<ReportPdf>> saveReportMetadata(ReportPdf reportPdf) async {
    await _exportBox.put(reportPdf.pdfId, jsonEncode(reportPdf.toJson()));
    return Result.success(reportPdf);
  }
}
