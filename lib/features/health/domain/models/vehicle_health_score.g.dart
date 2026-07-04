// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_health_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleHealthScoreImpl _$$VehicleHealthScoreImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleHealthScoreImpl(
  overallScore: (json['overallScore'] as num?)?.toInt() ?? 100,
  engineScore: (json['engineScore'] as num?)?.toInt() ?? 100,
  batteryScore: (json['batteryScore'] as num?)?.toInt() ?? 100,
  emissionsScore: (json['emissionsScore'] as num?)?.toInt() ?? 100,
  coolingScore: (json['coolingScore'] as num?)?.toInt() ?? 100,
  fuelSystemScore: (json['fuelSystemScore'] as num?)?.toInt() ?? 100,
  transmissionScore: (json['transmissionScore'] as num?)?.toInt() ?? 100,
  electricalScore: (json['electricalScore'] as num?)?.toInt() ?? 100,
  driveabilityScore: (json['driveabilityScore'] as num?)?.toInt() ?? 100,
  confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
  calculatedAt: DateTime.parse(json['calculatedAt'] as String),
);

Map<String, dynamic> _$$VehicleHealthScoreImplToJson(
  _$VehicleHealthScoreImpl instance,
) => <String, dynamic>{
  'overallScore': instance.overallScore,
  'engineScore': instance.engineScore,
  'batteryScore': instance.batteryScore,
  'emissionsScore': instance.emissionsScore,
  'coolingScore': instance.coolingScore,
  'fuelSystemScore': instance.fuelSystemScore,
  'transmissionScore': instance.transmissionScore,
  'electricalScore': instance.electricalScore,
  'driveabilityScore': instance.driveabilityScore,
  'confidence': instance.confidence,
  'calculatedAt': instance.calculatedAt.toIso8601String(),
};
