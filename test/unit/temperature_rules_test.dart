import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_score.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_snapshot.dart';
import 'package:bizscan/features/health/domain/services/rules/cooling_rules.dart';

void main() {
  group('CoolingRules Unit Tests', () {
    late CoolingRules rules;

    setUp(() {
      rules = CoolingRules();
    });

    VehicleHealthSnapshot createSnapshot(double temp) {
      return VehicleHealthSnapshot(
        liveSensors: {'COOLANT_TEMP': temp},
        score: VehicleHealthScore(calculatedAt: DateTime.now()),
        snapshotAt: DateTime.now(),
      );
    }

    test('85°C yields zero cooling alerts (Normal)', () {
      final alerts = rules.evaluate(createSnapshot(85.0));
      expect(alerts.isEmpty, true);
    });

    test('102°C evaluates to Elevated Coolant Temperature (Warning)', () {
      final alerts = rules.evaluate(createSnapshot(102.0));
      expect(alerts.length, 1);
      expect(alerts.first.severity, 'medium');
    });

    test('115°C evaluates to Critical Engine Temperature (Critical Overheat)', () {
      final alerts = rules.evaluate(createSnapshot(115.0));
      expect(alerts.length, 1);
      expect(alerts.first.severity, 'critical');
      expect(alerts.first.description, contains('stop vehicle immediately'));
    });
  });
}
