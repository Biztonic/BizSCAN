import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_section.dart';

part 'report_template.freezed.dart';
part 'report_template.g.dart';

@freezed
class ReportTemplate with _$ReportTemplate {
  const factory ReportTemplate({
    required String templateId,
    required String templateName,
    @Default('professional_dark') String theme,
    @Default([]) List<ReportSection> sections,
    @Default('A4') String pageSize,
    @Default('portrait') String orientation,
    @Default(true) bool showLogo,
    @Default(true) bool showQRCode,
  }) = _ReportTemplate;

  factory ReportTemplate.fromJson(Map<String, dynamic> json) =>
      _$ReportTemplateFromJson(json);
}
