import 'dart:convert';
import '../models/diagnostic_report.dart';

class JSONExporter {
  String exportJson(DiagnosticReport report) {
    return const JsonEncoder.withIndent('  ').convert(report.toJson());
  }

  DiagnosticReport importJson(String jsonStr) {
    final Map<String, dynamic> map = jsonDecode(jsonStr);
    return DiagnosticReport.fromJson(map);
  }
}
