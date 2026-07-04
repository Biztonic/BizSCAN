// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardLayoutImpl _$$DashboardLayoutImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardLayoutImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  visibleWidgetIds:
      (json['visibleWidgetIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  gridColumns: (json['gridColumns'] as num?)?.toInt() ?? 2,
  refreshRateMs: (json['refreshRateMs'] as num?)?.toInt() ?? 33,
  isDefault: json['isDefault'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$DashboardLayoutImplToJson(
  _$DashboardLayoutImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'visibleWidgetIds': instance.visibleWidgetIds,
  'gridColumns': instance.gridColumns,
  'refreshRateMs': instance.refreshRateMs,
  'isDefault': instance.isDefault,
  'createdAt': instance.createdAt.toIso8601String(),
};
