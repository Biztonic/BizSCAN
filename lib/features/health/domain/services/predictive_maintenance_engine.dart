import '../models/maintenance_recommendation.dart';
import '../models/vehicle_health_snapshot.dart';

class PredictiveMaintenanceEngine {
  List<MaintenanceRecommendation> generateRecommendations(VehicleHealthSnapshot currentSnapshot) {
    final list = <MaintenanceRecommendation>[];

    final sensors = currentSnapshot.liveSensors;
    final dtcs = currentSnapshot.dtcs;

    // 1. Battery Replacement Prediction
    final v = sensors['BATTERY_VOLTAGE'];
    if (v != null && v is num && v < 11.8) {
      list.add(MaintenanceRecommendation(
        title: 'Replace 12V Battery',
        description: 'Low battery voltage detected (${v.toStringAsFixed(1)}V). Battery is nearing end of useful life.',
        urgency: 'soon',
        estimatedCost: '₹3,500 - ₹6,500',
        estimatedTime: '20 mins',
        diyPossible: true,
        confidence: 0.95,
        sourceRules: const ['RULE_BATTERY'],
      ));
    }

    // 2. Spark Plug Replacement Prediction
    final misfire = dtcs.any((d) => d.startsWith('P030'));
    if (misfire) {
      list.add(const MaintenanceRecommendation(
        title: 'Replace Ignition Spark Plugs & Coils',
        description: 'Engine cylinder misfires detected. Worn spark plug gaps impair ignition efficiency.',
        urgency: 'immediate',
        estimatedCost: '₹1,200 - ₹3,000',
        estimatedTime: '45 mins',
        diyPossible: true,
        confidence: 0.94,
        sourceRules: ['RULE_ENGINE'],
      ));
    }

    // 3. Air Filter / Intake Cleaning Prediction
    final trim = sensors['FUEL_TRIM'];
    if ((trim != null && trim is num && trim > 15) || dtcs.contains('P0171')) {
      list.add(const MaintenanceRecommendation(
        title: 'Clean Air Filter & Inspect Intake Vacuum Lines',
        description: 'High fuel trims suggest restricted air filter or intake manifold vacuum leak.',
        urgency: 'soon',
        estimatedCost: '₹400 - ₹1,000',
        estimatedTime: '15 mins',
        diyPossible: true,
        confidence: 0.92,
        sourceRules: ['RULE_FUEL'],
      ));
    }

    // 4. Coolant Replacement Prediction
    final t = sensors['COOLANT_TEMP'];
    if (t != null && t is num && t > 100) {
      list.add(MaintenanceRecommendation(
        title: 'Engine Coolant Flush & Thermostat Check',
        description: 'Coolant temperature reached elevated levels (${t.toStringAsFixed(0)}°C).',
        urgency: 'immediate',
        estimatedCost: '₹1,500 - ₹3,500',
        estimatedTime: '60 mins',
        diyPossible: false,
        confidence: 0.90,
        sourceRules: const ['RULE_COOLING'],
      ));
    }

    // 5. Engine Oil Service (Routine Fallback)
    if (list.isEmpty) {
      list.add(const MaintenanceRecommendation(
        title: 'Routine Engine Oil & Filter Service',
        description: 'All core systems operating normally. Schedule routine oil change per manufacturer interval.',
        urgency: 'routine',
        estimatedCost: '₹2,000 - ₹4,500',
        estimatedTime: '45 mins',
        diyPossible: false,
        confidence: 1.0,
        sourceRules: ['ROUTINE_PREVENTATIVE'],
      ));
    }

    return list;
  }
}
