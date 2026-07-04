import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class FuelRules implements HealthRule {
  @override
  String get ruleId => 'RULE_FUEL';

  @override
  String get category => 'fuel';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final trimObj = snapshot.liveSensors['FUEL_TRIM'];
    final hasP0171 = snapshot.dtcs.contains('P0171');

    double trim = 0.0;
    if (trimObj != null && trimObj is num) {
      trim = trimObj.toDouble();
    }

    if (hasP0171 || trim > 20.0) {
      alerts.add(HealthAlert(
        id: 'ALERT_FUEL_VACUUM_LEAK',
        title: 'Possible Vacuum Leak',
        description: 'High fuel trim positive adjustment (${trim.toStringAsFixed(1)}%) indicates lean air-fuel ratio.',
        severity: 'high',
        priority: 2,
        category: 'fuel',
        source: hasP0171 ? 'dtc' : 'sensor',
        recommendation: 'Inspect intake manifold gaskets, vacuum hoses, and MAF sensor.',
        confidence: 0.95,
        affectedSystems: ['Fuel Injection', 'Air Intake'],
        createdAt: DateTime.now(),
      ));
    }

    return alerts;
  }
}
