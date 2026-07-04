// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_health_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleHealthSnapshotImpl _$$VehicleHealthSnapshotImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleHealthSnapshotImpl(
  liveSensors: json['liveSensors'] as Map<String, dynamic>,
  dtcs:
      (json['dtcs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  readiness:
      (json['readiness'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {},
  freezeFrame: json['freezeFrame'] as Map<String, dynamic>? ?? const {},
  score: VehicleHealthScore.fromJson(json['score'] as Map<String, dynamic>),
  alerts:
      (json['alerts'] as List<dynamic>?)
          ?.map((e) => HealthAlert.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map(
            (e) =>
                MaintenanceRecommendation.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  snapshotAt: DateTime.parse(json['snapshotAt'] as String),
);

Map<String, dynamic> _$$VehicleHealthSnapshotImplToJson(
  _$VehicleHealthSnapshotImpl instance,
) => <String, dynamic>{
  'liveSensors': instance.liveSensors,
  'dtcs': instance.dtcs,
  'readiness': instance.readiness,
  'freezeFrame': instance.freezeFrame,
  'score': instance.score,
  'alerts': instance.alerts,
  'recommendations': instance.recommendations,
  'snapshotAt': instance.snapshotAt.toIso8601String(),
};
