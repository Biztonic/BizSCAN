import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';
import 'health_rule.dart';

class TransmissionRules implements HealthRule {
  @override
  String get ruleId => 'RULE_TRANSMISSION';

  @override
  String get category => 'transmission';

  @override
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot) {
    final alerts = <HealthAlert>[];
    final transDtcs = snapshot.dtcs.where((d) => d.startsWith('P07')).toList();

    if (transDtcs.isNotEmpty) {
      alerts.add(HealthAlert(
        id: 'ALERT_TRANS_FAULT',
        title: 'Transmission Control Fault',
        description: 'Transmission control system fault code detected (${transDtcs.join(', ')}).',
        severity: 'high',
        priority: 2,
        category: 'transmission',
        source: 'dtc',
        recommendation: 'Inspect transmission fluid level, solenoids, and wiring harness.',
        confidence: 0.90,
        affectedSystems: ['Gearbox', 'Transmission Control Unit'],
        createdAt: DateTime.now(),
      ));
    }

    return alerts;
  }
}
