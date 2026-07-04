import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_information.dart';
import 'report_section.dart';
import 'workshop_information.dart';

part 'diagnostic_report.freezed.dart';
part 'diagnostic_report.g.dart';

@freezed
class DiagnosticReport with _$DiagnosticReport {
  const factory DiagnosticReport({
    required String reportId,
    required String vehicleId,
    required String sessionId,
    required String reportNumber,
    required DateTime generatedAt,
    @Default('Senior Technician') String generatedBy,
    @Default('Comprehensive Diagnostic') String reportType,
    @Default('v1.0') String reportVersion,
    @Default('draft') String reportStatus, // 'draft', 'finalized', 'signed', 'archived'
    CustomerInformation? customerInfo,
    WorkshopInformation? workshopInfo,
    @Default([]) List<ReportSection> sections,
    @Default('') String digitalHash,
    @Default('') String technicianSignature,
    @Default('') String customerSignature,
  }) = _DiagnosticReport;

  factory DiagnosticReport.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticReportFromJson(json);
}
