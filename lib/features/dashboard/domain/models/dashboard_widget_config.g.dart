// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_widget_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardWidgetConfigImpl _$$DashboardWidgetConfigImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardWidgetConfigImpl(
  widgetId: json['widgetId'] as String,
  type: json['type'] as String,
  pidSource: json['pidSource'] as String,
  themeMode: json['themeMode'] as String? ?? 'dark',
  colorScheme: json['colorScheme'] as String? ?? 'blue',
  size: json['size'] as String? ?? 'medium',
  refreshIntervalMs: (json['refreshIntervalMs'] as num?)?.toInt() ?? 33,
);

Map<String, dynamic> _$$DashboardWidgetConfigImplToJson(
  _$DashboardWidgetConfigImpl instance,
) => <String, dynamic>{
  'widgetId': instance.widgetId,
  'type': instance.type,
  'pidSource': instance.pidSource,
  'themeMode': instance.themeMode,
  'colorScheme': instance.colorScheme,
  'size': instance.size,
  'refreshIntervalMs': instance.refreshIntervalMs,
};
