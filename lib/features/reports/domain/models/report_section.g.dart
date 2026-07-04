// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportSectionImpl _$$ReportSectionImplFromJson(Map<String, dynamic> json) =>
    _$ReportSectionImpl(
      sectionId: json['sectionId'] as String,
      type: $enumDecode(_$ReportSectionTypeEnumMap, json['type']),
      title: json['title'] as String,
      enabled: json['enabled'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      contentJson: json['contentJson'] as String? ?? '',
    );

Map<String, dynamic> _$$ReportSectionImplToJson(_$ReportSectionImpl instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'type': _$ReportSectionTypeEnumMap[instance.type]!,
      'title': instance.title,
      'enabled': instance.enabled,
      'sortOrder': instance.sortOrder,
      'contentJson': instance.contentJson,
    };

const _$ReportSectionTypeEnumMap = {
  ReportSectionType.vehicleInfo: 'vehicleInfo',
  ReportSectionType.diagnosticSummary: 'diagnosticSummary',
  ReportSectionType.dtcList: 'dtcList',
  ReportSectionType.healthScore: 'healthScore',
  ReportSectionType.liveTelemetry: 'liveTelemetry',
  ReportSectionType.charts: 'charts',
  ReportSectionType.maintenance: 'maintenance',
  ReportSectionType.recommendations: 'recommendations',
  ReportSectionType.technicianNotes: 'technicianNotes',
};
