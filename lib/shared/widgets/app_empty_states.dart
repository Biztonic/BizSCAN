import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onActionPressed,
  });

  // Factory constructor for No Vehicle state
  factory AppEmptyState.noVehicle({VoidCallback? onAddPressed}) {
    return AppEmptyState(
      icon: Icons.directions_car_rounded,
      title: 'No Vehicle Added',
      description: 'You haven\'t linked any car to your profile yet. Add a vehicle to begin diagnostic scans.',
      actionLabel: 'Add Vehicle',
      onActionPressed: onAddPressed,
    );
  }

  // Factory constructor for No Internet state
  factory AppEmptyState.noInternet({VoidCallback? onRetryPressed}) {
    return AppEmptyState(
      icon: Icons.wifi_off_rounded,
      title: 'No Internet Connection',
      description: 'Check your cellular data or Wi-Fi settings. AI-based insights require an active connection.',
      actionLabel: 'Retry',
      onActionPressed: onRetryPressed,
    );
  }

  // Factory constructor for No Scan state
  factory AppEmptyState.noScan({VoidCallback? onScanPressed}) {
    return AppEmptyState(
      icon: Icons.radar_rounded,
      title: 'No Diagnosis Completed',
      description: 'A full scan checks active trouble codes (DTCs), emissions statuses, and logs sensor telemetry.',
      actionLabel: 'Run Diagnostics Scan',
      onActionPressed: onScanPressed,
    );
  }

  // Factory constructor for No Reports state
  factory AppEmptyState.noReports() {
    return const AppEmptyState(
      icon: Icons.assessment_outlined,
      title: 'No Reports Found',
      description: 'Completed vehicle scanning runs will generate detailed troubleshooting and maintenance PDF reports here.',
    );
  }

  // Factory constructor for No Bluetooth state
  factory AppEmptyState.noBluetooth({VoidCallback? onEnablePressed}) {
    return AppEmptyState(
      icon: Icons.bluetooth_disabled_rounded,
      title: 'Bluetooth is Disabled',
      description: 'Enable Bluetooth on your mobile device to establish connection links with ELM327 OBD-II scanners.',
      actionLabel: 'Enable Bluetooth',
      onActionPressed: onEnablePressed,
    );
  }

  // Factory constructor for No History state
  factory AppEmptyState.noHistory() {
    return const AppEmptyState(
      icon: Icons.history_rounded,
      title: 'No Diagnostic History',
      description: 'All past engine scans, trouble codes resolutions, and sensor records will be stored in this log.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacing24),
                decoration: BoxDecoration(
                  color: context.colors.primary.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 64,
                  color: context.colors.primary.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.5),
                  height: 1.45,
                ),
              ),
              if (actionLabel != null && onActionPressed != null) ...[
                const SizedBox(height: AppTheme.spacing32),
                SizedBox(
                  width: 220,
                  height: AppTheme.buttonHeightMedium,
                  child: ElevatedButton(
                    onPressed: onActionPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.primary,
                      foregroundColor: context.colors.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                      ),
                    ),
                    child: Text(
                      actionLabel!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
