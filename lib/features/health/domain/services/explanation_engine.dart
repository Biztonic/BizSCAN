import '../models/health_alert.dart';
import '../models/maintenance_recommendation.dart';

class RecommendationExplanation {
  final String recommendationTitle;
  final String whyItAppeared;
  final String rootCauseSensorsAndDtcs;
  final double confidence;
  final String suggestedAction;
  final String driveabilityAdvice; // 'Safe to drive', 'Exercise caution', 'Stop vehicle immediately'
  final String repairUrgency;
  final bool canDiy;

  const RecommendationExplanation({
    required this.recommendationTitle,
    required this.whyItAppeared,
    required this.rootCauseSensorsAndDtcs,
    required this.confidence,
    required this.suggestedAction,
    required this.driveabilityAdvice,
    required this.repairUrgency,
    required this.canDiy,
  });
}

class ExplanationEngine {
  RecommendationExplanation explain(
    MaintenanceRecommendation recommendation,
    List<HealthAlert> activeAlerts,
  ) {
    // Match alerts relevant to recommendation
    final relevantAlerts = activeAlerts.where((a) {
      return recommendation.sourceRules.contains(a.category) ||
          recommendation.sourceRules.any((r) => a.id.contains(r));
    }).toList();

    String why = 'Triggered by preventative maintenance rules.';
    String root = 'Routine interval';
    String advice = 'Safe to drive';

    if (relevantAlerts.isNotEmpty) {
      final mainAlert = relevantAlerts.first;
      why = 'Triggered by alert: ${mainAlert.title} (${mainAlert.description})';
      root = 'Sensor/DTC Source: ${mainAlert.source.toUpperCase()} (${mainAlert.affectedSystems.join(', ')})';

      if (mainAlert.severity == 'critical') {
        advice = 'Stop vehicle immediately! Extended driving may cause severe mechanical damage.';
      } else if (mainAlert.severity == 'high') {
        advice = 'Exercise caution. Drive directly to a nearby service station.';
      } else {
        advice = 'Safe to drive. Schedule service at your earliest convenience.';
      }
    }

    return RecommendationExplanation(
      recommendationTitle: recommendation.title,
      whyItAppeared: why,
      rootCauseSensorsAndDtcs: root,
      confidence: recommendation.confidence,
      suggestedAction: recommendation.description,
      driveabilityAdvice: advice,
      repairUrgency: recommendation.urgency,
      canDiy: recommendation.diyPossible,
    );
  }
}
