import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class ElectricalRules implements HealthRule {
  @override
  String get ruleId => 'RULE_ELECTRICAL';

  @override
  String get category => 'electrical';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final uDtcs = snapshot.dtcs.where((d) => d.startsWith('U')).toList();

    if (uDtcs.isNotEmpty) {
      alerts.add(HealthAlert(
        id: 'ALERT_ELEC_BUS_NOISE',
        title: 'Network Communication Noise',
        description: 'Inter-module CAN communication faults detected (${uDtcs.join(', ')}).',
        severity: 'medium',
        priority: 3,
        category: 'electrical',
        source: 'dtc',
        recommendation: 'Check CAN bus ground points and wiring harness connections.',
        confidence: 0.88,
        affectedSystems: ['CAN Network', 'ECU Communication'],
        createdAt: DateTime.now(),
      ));
    }

    return alerts;
  }
}
