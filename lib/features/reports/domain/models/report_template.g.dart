// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportTemplateImpl _$$ReportTemplateImplFromJson(Map<String, dynamic> json) =>
    _$ReportTemplateImpl(
      templateId: json['templateId'] as String,
      templateName: json['templateName'] as String,
      theme: json['theme'] as String? ?? 'professional_dark',
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => ReportSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pageSize: json['pageSize'] as String? ?? 'A4',
      orientation: json['orientation'] as String? ?? 'portrait',
      showLogo: json['showLogo'] as bool? ?? true,
      showQRCode: json['showQRCode'] as bool? ?? true,
    );

Map<String, dynamic> _$$ReportTemplateImplToJson(
  _$ReportTemplateImpl instance,
) => <String, dynamic>{
  'templateId': instance.templateId,
  'templateName': instance.templateName,
  'theme': instance.theme,
  'sections': instance.sections,
  'pageSize': instance.pageSize,
  'orientation': instance.orientation,
  'showLogo': instance.showLogo,
  'showQRCode': instance.showQRCode,
};
