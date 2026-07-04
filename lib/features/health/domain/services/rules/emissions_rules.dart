import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class EmissionsRules implements HealthRule {
  @override
  String get ruleId => 'RULE_EMISSIONS';

  @override
  String get category => 'emissions';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    if (snapshot.dtcs.contains('P0420') || snapshot.dtcs.contains('P0430')) {
      alerts.add(HealthAlert(
        id: 'ALERT_EMISS_CATALYST',
        title: 'Catalyst Efficiency Below Threshold',
        description: 'Catalytic converter efficiency operates below required environmental standards.',
        severity: 'medium',
        priority: 3,
        category: 'emissions',
        source: 'dtc',
        recommendation: 'Inspect O2 sensors and catalytic converter body.',
        confidence: 0.90,
        affectedSystems: ['Exhaust System', 'Emissions'],
        createdAt: DateTime.now(),
      ));
    }
    return alerts;
  }
}
