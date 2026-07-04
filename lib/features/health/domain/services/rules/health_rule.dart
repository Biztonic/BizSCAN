import '../../models/health_alert.dart';
import '../../models/vehicle_health_snapshot.dart';

abstract class HealthRule {
  String get ruleId;
  String get category;
  List<HealthAlert> evaluate(VehicleHealthSnapshot snapshot);
}
