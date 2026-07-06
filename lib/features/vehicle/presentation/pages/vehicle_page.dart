import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../obd/presentation/providers/obd_provider.dart';
import '../../../vehicle_intelligence/presentation/providers/vehicle_intelligence_provider.dart';

class VehicleTab extends ConsumerWidget {
  const VehicleTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleAsync = ref.watch(currentVehicleProvider);
    final obdAsync = ref.watch(oBDStateNotifierProvider);

    final vehicle = vehicleAsync.valueOrNull;
    final obdData = obdAsync.valueOrNull ?? {
      'isConnected': false,
      'vin': '',
      'rpm': 0.0,
      'coolant': 0.0,
      'voltage': 12.4,
      'dtcs': <String>[],
    };

    final isConnected = obdData['isConnected'] == true;
    final rpm = (obdData['rpm'] as num?)?.toDouble() ?? 0.0;
    final coolant = (obdData['coolant'] as num?)?.toDouble() ?? 0.0;
    final voltage = (obdData['voltage'] as num?)?.toDouble() ?? 12.4;
    final vin = obdData['vin']?.toString().isNotEmpty == true 
        ? obdData['vin'] 
        : (vehicle?.vin ?? 'Not Connected');

    final String brandModel = vehicle != null 
        ? '${vehicle.brand} ${vehicle.model}' 
        : 'No Active Vehicle';

    final String engineCode = vehicle?.engineCode ?? '1.8L i-VTEC';
    final String fuelType = vehicle?.fuelType ?? 'Petrol';
    final String protocol = isConnected ? 'Auto-Detected' : 'OBD-II Standard';

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: Text(
          'My Vehicle',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vehicle Profile Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacing20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppTheme.spacing16),
                            decoration: BoxDecoration(
                              color: context.colors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.directions_car_filled_rounded,
                              color: context.colors.primary,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: AppTheme.spacing16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  brandModel,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.spacing4),
                                Text(
                                  'VIN: $vin',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colors.onSurface.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.spacing20),
                      const Divider(),
                      const SizedBox(height: AppTheme.spacing12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StatItem(label: 'Engine', value: engineCode),
                          _StatItem(label: 'Fuel Type', value: fuelType),
                          _StatItem(label: 'Protocol', value: protocol),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Dynamic Parameters Group
              Text(
                'Live Sensor Readouts',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              
              // Grid of standard sensors
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.4,
                crossAxisSpacing: AppTheme.spacing12,
                mainAxisSpacing: AppTheme.spacing12,
                children: [
                  _SensorGridItem(
                    name: 'Engine RPM',
                    value: isConnected ? rpm.toStringAsFixed(0) : '--',
                    unit: 'RPM',
                    icon: Icons.speed_rounded,
                  ),
                  _SensorGridItem(
                    name: 'Coolant Temp',
                    value: isConnected ? coolant.toStringAsFixed(0) : '--',
                    unit: '°C',
                    icon: Icons.thermostat_rounded,
                  ),
                  _SensorGridItem(
                    name: 'Battery Voltage',
                    value: isConnected ? voltage.toStringAsFixed(1) : '--',
                    unit: 'V',
                    icon: Icons.battery_charging_full_rounded,
                  ),
                  const _SensorGridItem(
                    name: 'Throttle Position',
                    value: '--',
                    unit: '%',
                    icon: Icons.settings_input_component_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: AppTheme.spacing4),
        Text(
          value,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SensorGridItem extends StatelessWidget {
  final String name;
  final String value;
  final String unit;
  final IconData icon;

  const _SensorGridItem({
    required this.name,
    required this.value,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: context.colors.primary.withOpacity(0.6), size: 20),
                Text(
                  unit,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppTheme.spacing4),
                Text(
                  name,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
