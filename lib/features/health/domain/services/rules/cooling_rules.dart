import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class CoolingRules implements HealthRule {
  @override
  String get ruleId => 'RULE_COOLING';

  @override
  String get category => 'cooling';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final tempObj = snapshot.liveSensors['COOLANT_TEMP'];

    if (tempObj != null && tempObj is num) {
      final t = tempObj.toDouble();

      if (t > 110.0) {
        alerts.add(HealthAlert(
          id: 'ALERT_COOL_OVERHEAT',
          title: 'Critical Engine Temperature',
          description: 'Engine coolant reached ${t.toStringAsFixed(0)}°C (>110°C). Pull over safely and stop vehicle immediately.',
          severity: 'critical',
          priority: 1,
          category: 'cooling',
          source: 'sensor',
          recommendation: 'Stop vehicle, turn off engine, and check coolant level once cooled down.',
          confidence: 0.99,
          affectedSystems: ['Engine', 'Cooling System'],
          createdAt: DateTime.now(),
        ));
      } else if (t >= 100.0) {
        alerts.add(HealthAlert(
          id: 'ALERT_COOL_ELEVATED',
          title: 'Elevated Coolant Temperature',
          description: 'Engine coolant is operating at ${t.toStringAsFixed(0)}°C. Monitor temperature gauge closely.',
          severity: 'medium',
          priority: 3,
          category: 'cooling',
          source: 'sensor',
          recommendation: 'Check radiator fan and coolant level.',
          confidence: 0.92,
          affectedSystems: ['Cooling System'],
          createdAt: DateTime.now(),
        ));
      }
    }

    return alerts;
  }
}
