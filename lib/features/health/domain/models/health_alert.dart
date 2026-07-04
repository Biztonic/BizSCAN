import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_alert.freezed.dart';
part 'health_alert.g.dart';

@freezed
class HealthAlert with _$HealthAlert {
  const factory HealthAlert({
    required String id,
    required String title,
    required String description,
    required String severity, // 'low', 'medium', 'high', 'critical'
    @Default(1) int priority, // 1 (highest) to 5
    required String category, // 'engine', 'battery', 'cooling', 'fuel', 'emissions', 'transmission', 'electrical'
    required String source, // 'sensor', 'dtc', 'rule_engine'
    required String recommendation,
    @Default(0.9) double confidence,
    @Default([]) List<String> affectedSystems,
    required DateTime createdAt,
  }) = _HealthAlert;

  factory HealthAlert.fromJson(Map<String, dynamic> json) =>
      _$HealthAlertFromJson(json);
}
