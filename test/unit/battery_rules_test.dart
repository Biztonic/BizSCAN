import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_score.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_snapshot.dart';
import 'package:bizscan/features/health/domain/services/rules/battery_rules.dart';

void main() {
  group('BatteryRules Unit Tests', () {
    late BatteryRules rules;

    setUp(() {
      rules = BatteryRules();
    });

    VehicleHealthSnapshot createSnapshot(double voltage) {
      return VehicleHealthSnapshot(
        liveSensors: {'BATTERY_VOLTAGE': voltage},
        score: VehicleHealthScore(calculatedAt: DateTime.now()),
        snapshotAt: DateTime.now(),
      );
    }

    test('10.0V evaluates to Critical Battery Failure', () {
      final alerts = rules.evaluate(createSnapshot(10.0));
      expect(alerts.length, 1);
      expect(alerts.first.severity, 'critical');
      expect(alerts.first.confidence, 0.99);
    });

    test('11.5V evaluates to Low Battery Voltage warning', () {
      final alerts = rules.evaluate(createSnapshot(11.5));
      expect(alerts.length, 1);
      expect(alerts.first.severity, 'medium');
      expect(alerts.first.confidence, 0.98);
    });

    test('12.6V yields no battery alerts', () {
      final alerts = rules.evaluate(createSnapshot(12.6));
      expect(alerts.isEmpty, true);
    });

    test('15.0V evaluates to Alternator Overcharge Warning', () {
      final alerts = rules.evaluate(createSnapshot(15.0));
      expect(alerts.length, 1);
      expect(alerts.first.severity, 'high');
    });
  });
}
