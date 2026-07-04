import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_score.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_snapshot.dart';
import 'package:bizscan/features/health/domain/services/rules/fuel_rules.dart';

void main() {
  group('DTC & Sensor Correlation Unit Tests', () {
    late FuelRules rules;

    setUp(() {
      rules = FuelRules();
    });

    test('P0171 DTC + Fuel Trim > 20% triggers Vacuum Leak Alert', () {
      final snapshot = VehicleHealthSnapshot(
        liveSensors: {'RPM': 850, 'FUEL_TRIM': 22.5},
        dtcs: ['P0171'],
        score: VehicleHealthScore(calculatedAt: DateTime.now()),
        snapshotAt: DateTime.now(),
      );

      final alerts = rules.evaluate(snapshot);

      expect(alerts.length, 1);
      expect(alerts.first.title, contains('Vacuum Leak'));
      expect(alerts.first.severity, 'high');
      expect(alerts.first.confidence, 0.95);
    });
  });
}
