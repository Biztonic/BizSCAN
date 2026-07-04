import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_recommendation.freezed.dart';
part 'maintenance_recommendation.g.dart';

@freezed
class MaintenanceRecommendation with _$MaintenanceRecommendation {
  const factory MaintenanceRecommendation({
    required String title,
    required String description,
    required String urgency, // 'immediate', 'soon', 'routine', 'preventative'
    required String estimatedCost, // e.g. "₹500 - ₹1,500"
    required String estimatedTime, // e.g. "30 mins"
    @Default(true) bool diyPossible,
    @Default(0.95) double confidence,
    @Default([]) List<String> sourceRules,
  }) = _MaintenanceRecommendation;

  factory MaintenanceRecommendation.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRecommendationFromJson(json);
}
