import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_score.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_snapshot.dart';
import 'package:bizscan/features/health/domain/services/predictive_maintenance_engine.dart';

void main() {
  group('PredictiveMaintenanceEngine Unit Tests', () {
    late PredictiveMaintenanceEngine engine;

    setUp(() {
      engine = PredictiveMaintenanceEngine();
    });

    test('generateRecommendations creates battery replacement recommendation on low voltage', () {
      final snapshot = VehicleHealthSnapshot(
        liveSensors: {'BATTERY_VOLTAGE': 11.5},
        score: VehicleHealthScore(calculatedAt: DateTime.now()),
        snapshotAt: DateTime.now(),
      );

      final recs = engine.generateRecommendations(snapshot);

      expect(recs.any((r) => r.title.contains('Battery')), true);
      expect(recs.first.urgency, 'soon');
      expect(recs.first.diyPossible, true);
    });

    test('generateRecommendations creates spark plug replacement recommendation on misfire DTC', () {
      final snapshot = VehicleHealthSnapshot(
        liveSensors: {'BATTERY_VOLTAGE': 12.6},
        dtcs: ['P0301'],
        score: VehicleHealthScore(calculatedAt: DateTime.now()),
        snapshotAt: DateTime.now(),
      );

      final recs = engine.generateRecommendations(snapshot);

      expect(recs.any((r) => r.title.contains('Spark Plugs')), true);
      expect(recs.first.urgency, 'immediate');
    });
  });
}
