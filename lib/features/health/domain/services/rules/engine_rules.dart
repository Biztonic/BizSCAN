import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class EngineRules implements HealthRule {
  @override
  String get ruleId => 'RULE_ENGINE';

  @override
  String get category => 'engine';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final misfireDtcs = snapshot.dtcs.where((d) => d.startsWith('P030')).toList();

    if (misfireDtcs.isNotEmpty) {
      alerts.add(HealthAlert(
        id: 'ALERT_ENG_MISFIRE',
        title: 'Engine Cylinder Misfire',
        description: 'Misfire diagnostic fault codes detected (${misfireDtcs.join(', ')}). Potential unburnt fuel in exhaust.',
        severity: 'high',
        priority: 1,
        category: 'engine',
        source: 'dtc',
        recommendation: 'Check spark plugs, ignition coils, and fuel injectors.',
        confidence: 0.96,
        affectedSystems: ['Ignition System', 'Cylinders'],
        createdAt: DateTime.now(),
      ));
    }

    return alerts;
  }
}
