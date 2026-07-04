import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/models/live_metric.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/services/dashboard_performance_monitor.dart';
import '../../domain/services/live_session_recorder.dart';
import '../controllers/dashboard_controller.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return sl<DashboardRepository>();
});

final dashboardControllerProvider = Provider<DashboardController>((ref) {
  return sl<DashboardController>();
});

final liveSessionRecorderProvider = Provider<LiveSessionRecorder>((ref) {
  return sl<LiveSessionRecorder>();
});

final dashboardPerformanceMonitorProvider = Provider<DashboardPerformanceMonitor>((ref) {
  return sl<DashboardPerformanceMonitor>();
});

final liveMetricsStreamProvider = StreamProvider<Map<String, LiveMetric>>((ref) {
  final controller = ref.watch(dashboardControllerProvider);
  return controller.metricsStream;
});
