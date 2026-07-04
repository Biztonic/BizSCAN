import '../models/health_alert.dart';
import '../models/vehicle_health_score.dart';

class HealthScoreCalculator {
  VehicleHealthScore calculateScore(List<HealthAlert> alerts, {DateTime? calculatedAt}) {
    var enginePenalty = 0;
    var batteryPenalty = 0;
    var coolingPenalty = 0;
    var fuelPenalty = 0;
    var emissionsPenalty = 0;
    var transmissionPenalty = 0;
    var electricalPenalty = 0;
    var overallPenalty = 0;

    for (final alert in alerts) {
      final penalty = _getPenalty(alert.severity);
      overallPenalty += penalty;

      switch (alert.category.toLowerCase()) {
        case 'engine':
          enginePenalty += penalty;
          break;
        case 'battery':
          batteryPenalty += penalty;
          break;
        case 'cooling':
          coolingPenalty += penalty;
          break;
        case 'fuel':
          fuelPenalty += penalty;
          break;
        case 'emissions':
          emissionsPenalty += penalty;
          break;
        case 'transmission':
          transmissionPenalty += penalty;
          break;
        case 'electrical':
          electricalPenalty += penalty;
          break;
      }
    }

    final engineScore = (100 - enginePenalty).clamp(0, 100);
    final batteryScore = (100 - batteryPenalty).clamp(0, 100);
    final coolingScore = (100 - coolingPenalty).clamp(0, 100);
    final fuelScore = (100 - fuelPenalty).clamp(0, 100);
    final emissionsScore = (100 - emissionsPenalty).clamp(0, 100);
    final transmissionScore = (100 - transmissionPenalty).clamp(0, 100);
    final electricalScore = (100 - electricalPenalty).clamp(0, 100);

    final overall = (100 - overallPenalty).clamp(0, 100);

    return VehicleHealthScore(
      overallScore: overall,
      engineScore: engineScore,
      batteryScore: batteryScore,
      coolingScore: coolingScore,
      fuelSystemScore: fuelScore,
      emissionsScore: emissionsScore,
      transmissionScore: transmissionScore,
      electricalScore: electricalScore,
      driveabilityScore: ((engineScore + transmissionScore) / 2).round().clamp(0, 100),
      confidence: alerts.isEmpty ? 1.0 : 0.95,
      calculatedAt: calculatedAt ?? DateTime.now(),
    );
  }

  int _getPenalty(String severity) {
    switch (severity.toLowerCase()) {
      case 'critical':
        return 35;
      case 'high':
        return 20;
      case 'medium':
        return 12;
      case 'low':
      default:
        return 5;
    }
  }
}
