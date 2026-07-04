import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_health_score.freezed.dart';
part 'vehicle_health_score.g.dart';

@freezed
class VehicleHealthScore with _$VehicleHealthScore {
  const factory VehicleHealthScore({
    @Default(100) int overallScore, // 0 - 100
    @Default(100) int engineScore,
    @Default(100) int batteryScore,
    @Default(100) int emissionsScore,
    @Default(100) int coolingScore,
    @Default(100) int fuelSystemScore,
    @Default(100) int transmissionScore,
    @Default(100) int electricalScore,
    @Default(100) int driveabilityScore,
    @Default(1.0) double confidence, // 0.0 to 1.0
    required DateTime calculatedAt,
  }) = _VehicleHealthScore;

  factory VehicleHealthScore.fromJson(Map<String, dynamic> json) =>
      _$VehicleHealthScoreFromJson(json);
}
