import '../models/vehicle_health_snapshot.dart';

class TrendAnalysisReport {
  final String healthTrajectory; // 'improving', 'stable', 'degrading'
  final bool batteryDegradationDetected;
  final bool coolantEscalationDetected;
  final List<String> recurringDtcs;
  final String summary;

  const TrendAnalysisReport({
    required this.healthTrajectory,
    required this.batteryDegradationDetected,
    required this.coolantEscalationDetected,
    required this.recurringDtcs,
    required this.summary,
  });
}

class TrendAnalyzer {
  TrendAnalysisReport analyzeTrends(List<VehicleHealthSnapshot> history) {
    if (history.length < 2) {
      return const TrendAnalysisReport(
        healthTrajectory: 'stable',
        batteryDegradationDetected: false,
        coolantEscalationDetected: false,
        recurringDtcs: [],
        summary: 'Insufficient historical scans for trend analysis.',
      );
    }

    // Sort by snapshotAt ascending
    final sorted = List<VehicleHealthSnapshot>.from(history)
      ..sort((a, b) => a.snapshotAt.compareTo(b.snapshotAt));

    // 1. Overall Score Trajectory
    final firstScore = sorted.first.score.overallScore;
    final lastScore = sorted.last.score.overallScore;
    String trajectory = 'stable';
    if (lastScore < firstScore - 5) {
      trajectory = 'degrading';
    } else if (lastScore > firstScore + 5) {
      trajectory = 'improving';
    }

    // 2. Battery Voltage Degradation Check
    bool batteryDegradation = false;
    final voltages = <double>[];
    for (final s in sorted) {
      final v = s.liveSensors['BATTERY_VOLTAGE'];
      if (v != null && v is num) voltages.add(v.toDouble());
    }
    if (voltages.length >= 2 && voltages.last < voltages.first - 0.4) {
      batteryDegradation = true;
    }

    // 3. Coolant Temperature Escalation Check
    bool coolantEscalation = false;
    final temps = <double>[];
    for (final s in sorted) {
      final t = s.liveSensors['COOLANT_TEMP'];
      if (t != null && t is num) temps.add(t.toDouble());
    }
    if (temps.length >= 2 && temps.last > temps.first + 8.0) {
      coolantEscalation = true;
    }

    // 4. Recurring DTCs
    final dtcCounts = <String, int>{};
    for (final s in sorted) {
      for (final code in s.dtcs) {
        dtcCounts[code] = (dtcCounts[code] ?? 0) + 1;
      }
    }
    final recurring = dtcCounts.entries.where((e) => e.value >= 2).map((e) => e.key).toList();

    return TrendAnalysisReport(
      healthTrajectory: trajectory,
      batteryDegradationDetected: batteryDegradation,
      coolantEscalationDetected: coolantEscalation,
      recurringDtcs: recurring,
      summary: 'Vehicle health trajectory is $trajectory. Detected ${recurring.length} recurring DTC(s).',
    );
  }
}
