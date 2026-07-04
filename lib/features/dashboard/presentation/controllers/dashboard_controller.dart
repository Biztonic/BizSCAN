import 'dart:async';
import '../../domain/models/live_metric.dart';

class DashboardController {
  final Map<String, LiveMetric> _latestMetrics = {};
  final StreamController<Map<String, LiveMetric>> _metricsController =
      StreamController<Map<String, LiveMetric>>.broadcast();

  DateTime _lastUiRefresh = DateTime.now();
  static const int _minRefreshWindowMs = 33; // ~30 FPS Max

  Stream<Map<String, LiveMetric>> get metricsStream => _metricsController.stream;
  Map<String, LiveMetric> get currentMetrics => Map.unmodifiable(_latestMetrics);

  void updateMetric(String name, double value, String unit, {double warningThreshold = 95.0, double criticalThreshold = 110.0}) {
    final now = DateTime.now();
    final prev = _latestMetrics[name];
    final prevVal = prev?.currentValue ?? value;

    String trend = 'stable';
    if (value > prevVal + 0.1) {
      trend = 'up';
    } else if (value < prevVal - 0.1) {
      trend = 'down';
    }

    String status = 'normal';
    if (value >= criticalThreshold) {
      status = 'critical';
    } else if (value >= warningThreshold) {
      status = 'warning';
    }

    final metric = LiveMetric(
      metricName: name,
      currentValue: value,
      previousValue: prevVal,
      unit: unit,
      trend: trend,
      status: status,
      timestamp: now,
      isStale: false,
    );

    _latestMetrics[name] = metric;

    // 30 FPS UI throttling check
    if (now.difference(_lastUiRefresh).inMilliseconds >= _minRefreshWindowMs) {
      _lastUiRefresh = now;
      _metricsController.add(Map.unmodifiable(_latestMetrics));
    }
  }

  void checkStaleData({int timeoutMs = 3000}) {
    final now = DateTime.now();
    var updated = false;

    for (final key in _latestMetrics.keys) {
      final m = _latestMetrics[key]!;
      if (!m.isStale && now.difference(m.timestamp).inMilliseconds > timeoutMs) {
        _latestMetrics[key] = m.copyWith(isStale: true);
        updated = true;
      }
    }

    if (updated) {
      _metricsController.add(Map.unmodifiable(_latestMetrics));
    }
  }

  void dispose() {
    _metricsController.close();
  }
}
