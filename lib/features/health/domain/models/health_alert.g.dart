// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthAlertImpl _$$HealthAlertImplFromJson(Map<String, dynamic> json) =>
    _$HealthAlertImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      severity: json['severity'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 1,
      category: json['category'] as String,
      source: json['source'] as String,
      recommendation: json['recommendation'] as String,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.9,
      affectedSystems:
          (json['affectedSystems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$HealthAlertImplToJson(_$HealthAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'severity': instance.severity,
      'priority': instance.priority,
      'category': instance.category,
      'source': instance.source,
      'recommendation': instance.recommendation,
      'confidence': instance.confidence,
      'affectedSystems': instance.affectedSystems,
      'createdAt': instance.createdAt.toIso8601String(),
    };
