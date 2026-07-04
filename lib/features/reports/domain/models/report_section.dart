import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_section.freezed.dart';
part 'report_section.g.dart';

enum ReportSectionType {
  vehicleInfo,
  diagnosticSummary,
  dtcList,
  healthScore,
  liveTelemetry,
  charts,
  maintenance,
  recommendations,
  technicianNotes,
}

@freezed
class ReportSection with _$ReportSection {
  const factory ReportSection({
    required String sectionId,
    required ReportSectionType type,
    required String title,
    @Default(true) bool enabled,
    @Default(0) int sortOrder,
    @Default('') String contentJson,
  }) = _ReportSection;

  factory ReportSection.fromJson(Map<String, dynamic> json) =>
      _$ReportSectionFromJson(json);
}
