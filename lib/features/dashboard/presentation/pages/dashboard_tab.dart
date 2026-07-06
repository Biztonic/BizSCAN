import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/app_card_system.dart';
import '../../../../shared/widgets/app_list_tiles.dart';
import '../../../../shared/widgets/app_bars.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../authentication/presentation/providers/auth_provider.dart';
import '../../../obd/presentation/providers/obd_provider.dart';
import '../../../vehicle_intelligence/presentation/providers/vehicle_intelligence_provider.dart';

class DashboardTab extends ConsumerStatefulWidget {
  const DashboardTab({super.key});

  @override
  ConsumerState<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends ConsumerState<DashboardTab> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Periodically fetch OBD telemetry parameters if connected
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final obdState = ref.read(oBDStateNotifierProvider);
      final isConnected = obdState.value?['isConnected'] ?? false;
      if (isConnected) {
        ref.read(oBDStateNotifierProvider.notifier).connectAndFetch();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final vehicleAsync = ref.watch(currentVehicleProvider);
    final obdAsync = ref.watch(oBDStateNotifierProvider);

    final displayName = authState.maybeWhen(
      data: (user) => user?.displayName ?? 'Guest',
      orElse: () => 'Guest',
    );

    final vehicle = vehicleAsync.valueOrNull;
    final makeModel = vehicle != null ? '${vehicle.brand} ${vehicle.model}' : 'No Active Vehicle';

    final obdData = obdAsync.valueOrNull ?? {
      'isConnected': false,
      'vin': '',
      'rpm': 0.0,
      'coolant': 0.0,
      'voltage': 12.4,
      'dtcs': <String>[],
    };

    final isConnected = obdData['isConnected'] == true;
    final vin = obdData['vin']?.toString().isNotEmpty == true 
        ? obdData['vin'] 
        : (vehicle?.vin ?? 'Not Connected');
    final rpm = (obdData['rpm'] as num?)?.toDouble() ?? 0.0;
    final coolant = (obdData['coolant'] as num?)?.toDouble() ?? 0.0;
    final voltage = (obdData['voltage'] as num?)?.toDouble() ?? 12.4;
    final dtcs = obdData['dtcs'] as List<String>? ?? const [];

    final hasDtcs = dtcs.isNotEmpty;
    final healthScore = hasDtcs ? 72 : 98;
    final healthStatus = hasDtcs ? 'Diagnostic Warnings Detected' : 'Excellent Vehicle Health';
    final healthDescription = hasDtcs 
        ? 'AI diagnostics found ${dtcs.length} trouble codes (${dtcs.join(', ')}). Action recommended.' 
        : 'All powertrain, battery, and emissions control systems reporting normal.';

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppStandardBar(
        title: 'BizSCAN Control',
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacing16,
          vertical: AppTheme.spacing8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Greeting Card
            _buildGreetingCard(context, displayName),
            const SizedBox(height: AppTheme.spacing16),

            // 2. Active Vehicle Profile Card
            AppVehicleCard(
              makeModel: makeModel,
              vin: vin,
              protocol: isConnected ? 'Auto-Detected Protocol' : 'OBD-II Standard',
              isConnected: isConnected,
            ),
            const SizedBox(height: AppTheme.spacing16),

            // Connection Controller Action
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: isConnected ? 'Disconnect Scanner' : 'Connect OBD Scanner',
                    style: isConnected ? AppButtonStyle.secondary : AppButtonStyle.gradient,
                    onPressed: () async {
                      if (isConnected) {
                        await ref.read(oBDStateNotifierProvider.notifier).disconnect();
                      } else {
                        try {
                          await ref.read(oBDStateNotifierProvider.notifier).connectAndFetch();
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to connect: $e. Setup device in settings.')),
                            );
                          }
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing16),

            // 3. Health Score Card
            AppHealthCard(
              score: healthScore,
              status: healthStatus,
              description: healthDescription,
              onScanPressed: () {
                context.go('/reports');
              },
            ),
            const SizedBox(height: AppTheme.spacing20),

            // 4. Live Sensor Status Metrics Group
            Text(
              'Real-Time Telemetry',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacing12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.35,
              crossAxisSpacing: AppTheme.spacing12,
              mainAxisSpacing: AppTheme.spacing12,
              children: [
                AppMetricCard(
                  label: 'Engine Speed',
                  value: isConnected ? rpm.toStringAsFixed(0) : '--',
                  unit: 'RPM',
                  icon: Icons.speed_rounded,
                  activeColor: AppTheme.speedColor,
                ),
                AppMetricCard(
                  label: 'Coolant Temp',
                  value: isConnected ? coolant.toStringAsFixed(0) : '--',
                  unit: '°C',
                  icon: Icons.thermostat_rounded,
                  activeColor: AppTheme.temperatureColor,
                ),
                AppMetricCard(
                  label: 'Battery Potential',
                  value: isConnected ? voltage.toStringAsFixed(1) : '--',
                  unit: 'V',
                  icon: Icons.battery_charging_full_rounded,
                  activeColor: AppTheme.batteryColor,
                ),
                const AppMetricCard(
                  label: 'Fuel Economy',
                  value: '18.4',
                  unit: 'KM/L',
                  icon: Icons.local_gas_station_rounded,
                  activeColor: AppTheme.fuelColor,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing24),

            // 5. AI Recommendations
            Text(
              'Maintenance Insights',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacing12),
            AppRecommendationCard(
              title: hasDtcs ? 'Diagnostic Trouble Cleansing' : 'Routine Battery Health check',
              description: hasDtcs 
                  ? 'Active trouble codes detected. We recommend running a full scan and saving a diagnostic report.'
                  : 'Coolant and alternator outputs are operating within nominal thresholds. Reservoir check recommended.',
              actionLabel: 'View Sensor History',
              onTap: () {},
            ),
            const SizedBox(height: AppTheme.spacing16),

            // 6. Recent Report Preview Card
            Text(
              'Active Trouble Codes',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacing12),
            if (hasDtcs)
              ...dtcs.map((dtc) => AppReportTile(
                    faultCode: dtc,
                    description: 'Active Engine Malfunction Code detected via OBD protocol',
                    category: 'Powertrain Control System',
                    isCleared: false,
                    onTap: () {},
                  ))
            else
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(AppTheme.spacing16),
                  child: Center(child: Text('No active trouble codes detected')),
                ),
              ),
            const SizedBox(height: AppTheme.spacing32),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingCard(BuildContext context, String displayName) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.cardPadding),
      decoration: BoxDecoration(
        color: context.colors.primary.withOpacity(0.04),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: context.colors.outline.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Namaste, $displayName!',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppTheme.spacing4),
                Text(
                  'All diagnostic systems reporting online.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              displayName.isNotEmpty ? displayName[0].toUpperCase() : 'U',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
