import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/models/vehicle_health_snapshot.dart';
import '../../domain/repositories/vehicle_health_repository.dart';
import '../../domain/services/explanation_engine.dart';
import '../../domain/services/health_score_calculator.dart';
import '../../domain/services/predictive_maintenance_engine.dart';
import '../../domain/services/rules/health_rule_engine.dart';
import '../../domain/services/trend_analyzer.dart';

final vehicleHealthRepositoryProvider = Provider<VehicleHealthRepository>((ref) {
  return sl<VehicleHealthRepository>();
});

final healthRuleEngineProvider = Provider<HealthRuleEngine>((ref) {
  return sl<HealthRuleEngine>();
});

final healthScoreCalculatorProvider = Provider<HealthScoreCalculator>((ref) {
  return sl<HealthScoreCalculator>();
});

final trendAnalyzerProvider = Provider<TrendAnalyzer>((ref) {
  return sl<TrendAnalyzer>();
});

final predictiveMaintenanceEngineProvider = Provider<PredictiveMaintenanceEngine>((ref) {
  return sl<PredictiveMaintenanceEngine>();
});

final explanationEngineProvider = Provider<ExplanationEngine>((ref) {
  return sl<ExplanationEngine>();
});

final currentHealthAnalysisProvider = FutureProvider<VehicleHealthSnapshot?>((ref) async {
  final repo = ref.watch(vehicleHealthRepositoryProvider);
  return repo.getLatestSnapshot();
});

final trendAnalysisReportProvider = FutureProvider<TrendAnalysisReport>((ref) async {
  final repo = ref.watch(vehicleHealthRepositoryProvider);
  final analyzer = ref.watch(trendAnalyzerProvider);
  final history = await repo.getSnapshotHistory();
  return analyzer.analyzeTrends(history);
});
