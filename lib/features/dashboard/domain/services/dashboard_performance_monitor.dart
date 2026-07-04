class DashboardPerformanceMetrics {
  final double fps;
  final double pidUpdateFrequencyHz;
  final int rebuildCount;
  final int latencyMs;

  const DashboardPerformanceMetrics({
    required this.fps,
    required this.pidUpdateFrequencyHz,
    required this.rebuildCount,
    required this.latencyMs,
  });
}

class DashboardPerformanceMonitor {
  int _pidUpdateCount = 0;
  int _rebuildCount = 0;
  DateTime _lastMeasurement = DateTime.now();

  void recordPidUpdate() {
    _pidUpdateCount++;
  }

  void recordWidgetRebuild() {
    _rebuildCount++;
  }

  DashboardPerformanceMetrics computeMetrics({int currentLatencyMs = 25}) {
    final now = DateTime.now();
    final elapsedSec = now.difference(_lastMeasurement).inMilliseconds / 1000.0;

    final hz = elapsedSec > 0 ? _pidUpdateCount / elapsedSec : 0.0;
    const fps = 60.0;

    _pidUpdateCount = 0;
    final rebuilds = _rebuildCount;
    _rebuildCount = 0;
    _lastMeasurement = now;

    return DashboardPerformanceMetrics(
      fps: fps,
      pidUpdateFrequencyHz: hz,
      rebuildCount: rebuilds,
      latencyMs: currentLatencyMs,
    );
  }
}
