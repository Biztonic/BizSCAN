// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceRecommendationImpl _$$MaintenanceRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$MaintenanceRecommendationImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  urgency: json['urgency'] as String,
  estimatedCost: json['estimatedCost'] as String,
  estimatedTime: json['estimatedTime'] as String,
  diyPossible: json['diyPossible'] as bool? ?? true,
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.95,
  sourceRules:
      (json['sourceRules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MaintenanceRecommendationImplToJson(
  _$MaintenanceRecommendationImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'urgency': instance.urgency,
  'estimatedCost': instance.estimatedCost,
  'estimatedTime': instance.estimatedTime,
  'diyPossible': instance.diyPossible,
  'confidence': instance.confidence,
  'sourceRules': instance.sourceRules,
};
