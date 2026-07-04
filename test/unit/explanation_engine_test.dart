import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/health_alert.dart';
import 'package:bizscan/features/health/domain/models/maintenance_recommendation.dart';
import 'package:bizscan/features/health/domain/services/explanation_engine.dart';

void main() {
  group('ExplanationEngine Unit Tests', () {
    late ExplanationEngine engine;

    setUp(() {
      engine = ExplanationEngine();
    });

    test('explain generates clear driveability and urgency explanations for critical alert', () {
      const rec = MaintenanceRecommendation(
        title: 'Coolant Flush & Thermostat Replacement',
        description: 'Coolant temperature high',
        urgency: 'immediate',
        estimatedCost: '₹1,500 - ₹3,500',
        estimatedTime: '60 mins',
        diyPossible: false,
        confidence: 0.90,
        sourceRules: ['cooling'],
      );

      final alerts = [
        HealthAlert(
          id: 'ALERT_COOL_OVERHEAT',
          title: 'Critical Engine Temperature',
          description: 'Coolant temp 115°C',
          severity: 'critical',
          priority: 1,
          category: 'cooling',
          source: 'sensor',
          recommendation: 'Stop vehicle',
          affectedSystems: ['Cooling System'],
          createdAt: DateTime.now(),
        ),
      ];

      final exp = engine.explain(rec, alerts);

      expect(exp.recommendationTitle, rec.title);
      expect(exp.driveabilityAdvice, contains('Stop vehicle immediately'));
      expect(exp.repairUrgency, 'immediate');
      expect(exp.canDiy, false);
    });
  });
}
