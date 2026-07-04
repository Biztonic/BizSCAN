import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'battery_rules.dart';
import 'cooling_rules.dart';
import 'electrical_rules.dart';
import 'emissions_rules.dart';
import 'engine_rules.dart';
import 'fuel_rules.dart';
import 'health_rule.dart';
import 'transmission_rules.dart';

class HealthRuleEngine {
  final List<HealthRule> _rules;

  HealthRuleEngine([List<HealthRule>? customRules])
      : _rules = customRules ??
            [
              BatteryRules(),
              CoolingRules(),
              FuelRules(),
              EngineRules(),
              EmissionsRules(),
              TransmissionRules(),
              ElectricalRules(),
            ];

  List<HealthAlert> evaluateAll(VehicleHealthSnapshot snapshot) {
    final rawAlerts = <HealthAlert>[];
    for (final rule in _rules) {
      rawAlerts.addAll(rule.evaluate(snapshot));
    }

    // Duplicate suppression by alert ID
    final uniqueMap = <String, HealthAlert>{};
    for (final alert in rawAlerts) {
      if (!uniqueMap.containsKey(alert.id)) {
        uniqueMap[alert.id] = alert;
      }
    }

    final alerts = uniqueMap.values.toList();
    // Sort by priority (1 = highest) then severity
    alerts.sort((a, b) => a.priority.compareTo(b.priority));
    return alerts;
  }
}
