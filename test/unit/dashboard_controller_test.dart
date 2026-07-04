import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/dashboard/presentation/controllers/dashboard_controller.dart';

void main() {
  group('DashboardController Unit Tests', () {
    late DashboardController controller;

    setUp(() {
      controller = DashboardController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('updateMetric updates latest metric map and sets warning/critical status', () {
      controller.updateMetric('RPM', 750, 'RPM', warningThreshold: 5500, criticalThreshold: 6500);
      expect(controller.currentMetrics.containsKey('RPM'), true);
      expect(controller.currentMetrics['RPM']?.currentValue, 750);
      expect(controller.currentMetrics['RPM']?.status, 'normal');

      controller.updateMetric('COOLANT_TEMP', 115, '°C', warningThreshold: 100, criticalThreshold: 110);
      expect(controller.currentMetrics['COOLANT_TEMP']?.status, 'critical');
    });

    test('checkStaleData flags metrics older than 3000ms as stale', () async {
      controller.updateMetric('SPEED', 60, 'km/h', warningThreshold: 120, criticalThreshold: 160);
      expect(controller.currentMetrics['SPEED']?.isStale, false);

      await Future.delayed(const Duration(milliseconds: 50));
      controller.checkStaleData(timeoutMs: 10);

      expect(controller.currentMetrics['SPEED']?.isStale, true);
    });
  });
}
