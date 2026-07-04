import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_score.dart';
import 'package:bizscan/features/health/domain/models/vehicle_health_snapshot.dart';
import 'package:bizscan/features/health/domain/services/trend_analyzer.dart';

void main() {
  group('TrendAnalyzer Unit Tests', () {
    late TrendAnalyzer analyzer;

    setUp(() {
      analyzer = TrendAnalyzer();
    });

    test('analyzeTrends detects battery degradation and recurring DTCs', () {
      final now = DateTime.now();
      final history = [
        VehicleHealthSnapshot(
          liveSensors: {'BATTERY_VOLTAGE': 12.6},
          dtcs: ['P0300'],
          score: VehicleHealthScore(overallScore: 95, calculatedAt: now),
          snapshotAt: now.subtract(const Duration(days: 10)),
        ),
        VehicleHealthSnapshot(
          liveSensors: {'BATTERY_VOLTAGE': 12.0},
          dtcs: ['P0300'],
          score: VehicleHealthScore(overallScore: 75, calculatedAt: now),
          snapshotAt: now,
        ),
      ];

      final report = analyzer.analyzeTrends(history);

      expect(report.healthTrajectory, 'degrading');
      expect(report.batteryDegradationDetected, true);
      expect(report.recurringDtcs, contains('P0300'));
    });
  });
}
