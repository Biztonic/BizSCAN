import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/dashboard/domain/services/dashboard_performance_monitor.dart';

void main() {
  group('DashboardPerformanceMonitor Unit Tests', () {
    late DashboardPerformanceMonitor monitor;

    setUp(() {
      monitor = DashboardPerformanceMonitor();
    });

    test('computeMetrics records update frequency and rebuild count', () {
      monitor.recordPidUpdate();
      monitor.recordPidUpdate();
      monitor.recordWidgetRebuild();

      final metrics = monitor.computeMetrics(currentLatencyMs: 30);

      expect(metrics.rebuildCount, 1);
      expect(metrics.latencyMs, 30);
      expect(metrics.fps, 60.0);
    });
  });
}
