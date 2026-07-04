import 'package:freezed_annotation/freezed_annotation.dart';
import 'health_alert.dart';
import 'maintenance_recommendation.dart';
import 'vehicle_health_score.dart';

part 'vehicle_health_snapshot.freezed.dart';
part 'vehicle_health_snapshot.g.dart';

@freezed
class VehicleHealthSnapshot with _$VehicleHealthSnapshot {
  const factory VehicleHealthSnapshot({
    required Map<String, dynamic> liveSensors, // e.g. {'RPM': 750, 'COOLANT_TEMP': 85, 'BATTERY_VOLTAGE': 12.6, 'FUEL_TRIM': 2.5}
    @Default([]) List<String> dtcs, // e.g. ['P0171', 'P0300']
    @Default({}) Map<String, bool> readiness,
    @Default({}) Map<String, dynamic> freezeFrame,
    required VehicleHealthScore score,
    @Default([]) List<HealthAlert> alerts,
    @Default([]) List<MaintenanceRecommendation> recommendations,
    required DateTime snapshotAt,
  }) = _VehicleHealthSnapshot;

  factory VehicleHealthSnapshot.fromJson(Map<String, dynamic> json) =>
      _$VehicleHealthSnapshotFromJson(json);
}
