import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/health_alert.dart';
import 'package:bizscan/features/health/domain/services/health_score_calculator.dart';

void main() {
  group('HealthScoreCalculator Unit Tests', () {
    late HealthScoreCalculator calculator;

    setUp(() {
      calculator = HealthScoreCalculator();
    });

    test('calculateScore yields 100 for perfect vehicle with zero alerts', () {
      final score = calculator.calculateScore([]);

      expect(score.overallScore, 100);
      expect(score.engineScore, 100);
      expect(score.batteryScore, 100);
      expect(score.coolingScore, 100);
      expect(score.confidence, 1.0);
    });

    test('calculateScore yields 90+ for minor issue', () {
      final alerts = [
        HealthAlert(
          id: 'ALERT_LOW',
          title: 'Minor Sensor Drift',
          description: 'Slight drift detected',
          severity: 'low',
          priority: 4,
          category: 'electrical',
          source: 'sensor',
          recommendation: 'Monitor at next service',
          createdAt: DateTime.now(),
        ),
      ];

      final score = calculator.calculateScore(alerts);
      expect(score.overallScore, greaterThanOrEqualTo(90));
      expect(score.overallScore, lessThan(100));
    });

    test('calculateScore yields 70-89 for medium issue', () {
      final alerts = [
        HealthAlert(
          id: 'ALERT_BATT_LOW',
          title: 'Low Battery Voltage',
          description: 'Resting voltage 11.5V',
          severity: 'medium',
          priority: 2,
          category: 'battery',
          source: 'sensor',
          recommendation: 'Recharge battery',
          createdAt: DateTime.now(),
        ),
      ];

      final score = calculator.calculateScore(alerts);
      expect(score.overallScore, greaterThanOrEqualTo(70));
      expect(score.overallScore, lessThanOrEqualTo(89));
    });

    test('calculateScore yields 40-69 for serious issue', () {
      final alerts = [
        HealthAlert(
          id: 'ALERT_ENG_MISFIRE',
          title: 'Engine Cylinder Misfire',
          description: 'Misfire fault code',
          severity: 'high',
          priority: 1,
          category: 'engine',
          source: 'dtc',
          recommendation: 'Check spark plugs',
          createdAt: DateTime.now(),
        ),
        HealthAlert(
          id: 'ALERT_FUEL_VACUUM_LEAK',
          title: 'Possible Vacuum Leak',
          description: 'High fuel trim positive adjustment',
          severity: 'high',
          priority: 2,
          category: 'fuel',
          source: 'sensor',
          recommendation: 'Inspect intake gaskets',
          createdAt: DateTime.now(),
        ),
      ];

      final score = calculator.calculateScore(alerts);
      expect(score.overallScore, greaterThanOrEqualTo(40));
      expect(score.overallScore, lessThanOrEqualTo(69));
    });

    test('calculateScore yields below 40 for critical issue', () {
      final alerts = [
        HealthAlert(
          id: 'ALERT_COOL_OVERHEAT',
          title: 'Critical Engine Overheat',
          description: 'Coolant temperature 115°C',
          severity: 'critical',
          priority: 1,
          category: 'cooling',
          source: 'sensor',
          recommendation: 'Stop vehicle',
          createdAt: DateTime.now(),
        ),
        HealthAlert(
          id: 'ALERT_BATT_CRITICAL',
          title: 'Critical Battery Failure',
          description: 'Voltage 10.0V',
          severity: 'critical',
          priority: 1,
          category: 'battery',
          source: 'sensor',
          recommendation: 'Replace battery',
          createdAt: DateTime.now(),
        ),
      ];

      final score = calculator.calculateScore(alerts);
      expect(score.overallScore, lessThan(40));
    });
  });
}
