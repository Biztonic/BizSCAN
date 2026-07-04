// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveMetricImpl _$$LiveMetricImplFromJson(Map<String, dynamic> json) =>
    _$LiveMetricImpl(
      metricName: json['metricName'] as String,
      currentValue: (json['currentValue'] as num).toDouble(),
      previousValue: (json['previousValue'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] as String,
      trend: json['trend'] as String? ?? 'stable',
      status: json['status'] as String? ?? 'normal',
      timestamp: DateTime.parse(json['timestamp'] as String),
      isStale: json['isStale'] as bool? ?? false,
    );

Map<String, dynamic> _$$LiveMetricImplToJson(_$LiveMetricImpl instance) =>
    <String, dynamic>{
      'metricName': instance.metricName,
      'currentValue': instance.currentValue,
      'previousValue': instance.previousValue,
      'unit': instance.unit,
      'trend': instance.trend,
      'status': instance.status,
      'timestamp': instance.timestamp.toIso8601String(),
      'isStale': instance.isStale,
    };
