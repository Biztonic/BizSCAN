import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class BatteryRules implements HealthRule {
  @override
  String get ruleId => 'RULE_BATTERY';

  @override
  String get category => 'battery';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final voltageObj = snapshot.liveSensors['BATTERY_VOLTAGE'];

    if (voltageObj != null && voltageObj is num) {
      final v = voltageObj.toDouble();

      if (v < 10.5) {
        alerts.add(HealthAlert(
          id: 'ALERT_BATT_CRITICAL',
          title: 'Critical Battery Failure',
          description: 'Battery voltage dropped to ${v.toStringAsFixed(1)}V. Immediate replacement required to avoid stranding.',
          severity: 'critical',
          priority: 1,
          category: 'battery',
          source: 'sensor',
          recommendation: 'Replace 12V battery and check alternator charging circuit.',
          confidence: 0.99,
          affectedSystems: ['Electrical', 'Starting System'],
          createdAt: DateTime.now(),
        ));
      } else if (v < 11.8) {
        alerts.add(HealthAlert(
          id: 'ALERT_BATT_LOW',
          title: 'Low Battery Voltage',
          description: 'Battery resting voltage is ${v.toStringAsFixed(1)}V (below 11.8V threshold). Charge or inspect battery.',
          severity: 'medium',
          priority: 2,
          category: 'battery',
          source: 'sensor',
          recommendation: 'Recharge battery or perform load test at a service center.',
          confidence: 0.98,
          affectedSystems: ['Electrical'],
          createdAt: DateTime.now(),
        ));
      } else if (v > 14.8) {
        alerts.add(HealthAlert(
          id: 'ALERT_BATT_OVERCHARGE',
          title: 'Alternator Overcharge Warning',
          description: 'Charging system voltage is ${v.toStringAsFixed(1)}V. Overcharging may damage electronics.',
          severity: 'high',
          priority: 2,
          category: 'battery',
          source: 'sensor',
          recommendation: 'Inspect alternator voltage regulator.',
          confidence: 0.95,
          affectedSystems: ['Alternator', 'Electrical'],
          createdAt: DateTime.now(),
        ));
      }
    }

    return alerts;
  }
}
