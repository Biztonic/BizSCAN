// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthReportImpl _$$HealthReportImplFromJson(Map<String, dynamic> json) =>
    _$HealthReportImpl(
      reportId: json['reportId'] as String,
      scanId: json['scanId'] as String,
      overallScore: (json['overallScore'] as num).toInt(),
      engineScore: (json['engineScore'] as num).toInt(),
      batteryScore: (json['batteryScore'] as num).toInt(),
      coolingScore: (json['coolingScore'] as num).toInt(),
      fuelScore: (json['fuelScore'] as num).toInt(),
      emissionScore: (json['emissionScore'] as num).toInt(),
      recommendations:
          (json['recommendations'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$HealthReportImplToJson(_$HealthReportImpl instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'scanId': instance.scanId,
      'overallScore': instance.overallScore,
      'engineScore': instance.engineScore,
      'batteryScore': instance.batteryScore,
      'coolingScore': instance.coolingScore,
      'fuelScore': instance.fuelScore,
      'emissionScore': instance.emissionScore,
      'recommendations': instance.recommendations,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
