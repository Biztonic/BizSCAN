import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/app_card_system.dart';
import '../../../../shared/widgets/app_list_tiles.dart';
import '../../../../shared/widgets/app_bars.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildGreetingCard(context),
            const SizedBox(height: AppTheme.spacing16),

            // 2. Active Vehicle Profile Card
            const AppVehicleCard(
              makeModel: 'Maruti Swift VXI (Mock)',
              vin: 'MA3FDE51S00192X4',
              protocol: 'ISO 15765-4 (CAN 11/500)',
              isConnected: true,
            ),
            const SizedBox(height: AppTheme.spacing16),

            // 3. Health Score Card
            AppHealthCard(
              score: 94,
              status: 'Excellent Vehicle Health',
              description: 'AI diagnostics report no severe powertrain or emissions control malfunctions. 1 notification pending.',
              onScanPressed: () {},
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
              children: const [
                AppMetricCard(
                  label: 'Engine Speed',
                  value: '840',
                  unit: 'RPM',
                  icon: Icons.speed_rounded,
                  activeColor: AppTheme.speedColor,
                ),
                AppMetricCard(
                  label: 'Coolant Temp',
                  value: '91',
                  unit: '°C',
                  icon: Icons.thermostat_rounded,
                  activeColor: AppTheme.temperatureColor,
                ),
                AppMetricCard(
                  label: 'Battery Potential',
                  value: '13.8',
                  unit: 'V',
                  icon: Icons.battery_charging_full_rounded,
                  activeColor: AppTheme.batteryColor,
                ),
                AppMetricCard(
                  label: 'Fuel Economy',
                  value: '18.4',
                  unit: 'KM/L',
                  icon: Icons.local_gas_station_rounded,
                  activeColor: AppTheme.fuelColor,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing24),

            // 5. AI Recommendations (Tips Card)
            Text(
              'Maintenance Insights',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacing12),
            AppRecommendationCard(
              title: 'Routine Coolant Checkup',
              description: 'Coolant temperature reached a maximum of 96°C during prolonged highway driving. Verify reservoir liquid levels.',
              actionLabel: 'View Sensor History',
              onTap: () {},
            ),
            const SizedBox(height: AppTheme.spacing16),

            // 6. Recent Report Preview Card
            Text(
              'Recent Scanning Logs',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppTheme.spacing12),
            AppReportTile(
              faultCode: 'P0113',
              description: 'Intake Air Temperature Sensor Circuit High Input',
              category: 'Powertrain Control System',
              isCleared: false,
              onTap: () {},
            ),
            AppReportTile(
              faultCode: 'P0300',
              description: 'Random/Multiple Cylinder Misfire Detected',
              category: 'Engine Ignition System',
              isCleared: true,
              onTap: () {},
            ),
            const SizedBox(height: AppTheme.spacing32),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingCard(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Namaste, Rohan!',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'R',
              style: TextStyle(
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
