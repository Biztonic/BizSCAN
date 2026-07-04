import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/utils/haptic_helper.dart';

class AppSettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const AppSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        leading: Icon(icon, color: context.colors.primary),
        title: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
        trailing: trailing ?? const Icon(Icons.chevron_right_rounded, size: 20),
        onTap: () {
          HapticHelper.lightTap();
          onTap();
        },
      ),
    );
  }
}

class AppHistoryTile extends StatelessWidget {
  final String vehicleName;
  final String date;
  final int dtcCount;
  final int score;
  final VoidCallback onTap;

  const AppHistoryTile({
    super.key,
    required this.vehicleName,
    required this.date,
    required this.dtcCount,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = score >= 90
        ? AppTheme.healthExcellent
        : score >= 70
            ? AppTheme.healthGood
            : AppTheme.errorColor;

    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        title: Text(
          vehicleName,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_today_rounded, size: 12, color: context.colors.onSurface.withOpacity(0.4)),
            const SizedBox(width: AppTheme.spacing4),
            Text(
              date,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$score/100',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                Text(
                  dtcCount == 0 ? 'No DTCs' : '$dtcCount Faults',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: dtcCount == 0 ? AppTheme.successColor : AppTheme.errorColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppTheme.spacing8),
            const Icon(Icons.chevron_right_rounded, size: 20),
          ],
        ),
        onTap: () {
          HapticHelper.lightTap();
          onTap();
        },
      ),
    );
  }
}

class AppVehicleTile extends StatelessWidget {
  final String model;
  final String vin;
  final bool isSelected;
  final VoidCallback onTap;

  const AppVehicleTile({
    super.key,
    required this.model,
    required this.vin,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? context.colors.primary : Colors.transparent,
          width: AppTheme.borderMedium,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      ),
      child: ListTile(
        leading: Icon(
          Icons.directions_car_rounded,
          color: isSelected ? context.colors.primary : context.colors.onSurface.withOpacity(0.5),
        ),
        title: Text(
          model,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'VIN: $vin',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle_rounded, color: context.colors.primary)
            : const Icon(Icons.circle_outlined, size: 20),
        onTap: () {
          HapticHelper.lightTap();
          onTap();
        },
      ),
    );
  }
}

class AppReportTile extends StatelessWidget {
  final String faultCode;
  final String description;
  final String category;
  final bool isCleared;
  final VoidCallback onTap;

  const AppReportTile({
    super.key,
    required this.faultCode,
    required this.description,
    required this.category,
    required this.isCleared,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isCleared ? AppTheme.successColor.withOpacity(0.12) : AppTheme.errorColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          ),
          child: Text(
            faultCode,
            style: context.textTheme.labelMedium?.copyWith(
              color: isCleared ? AppTheme.successColor : AppTheme.errorColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          category,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.4),
          ),
        ),
        trailing: Icon(
          isCleared ? Icons.check_circle_rounded : Icons.info_outline_rounded,
          color: isCleared ? AppTheme.successColor : AppTheme.errorColor,
          size: 20,
        ),
        onTap: () {
          HapticHelper.lightTap();
          onTap();
        },
      ),
    );
  }
}

class AppBluetoothDeviceTile extends StatelessWidget {
  final String name;
  final String address;
  final int rssi;
  final bool isConnected;
  final bool isConnecting;
  final VoidCallback onTap;

  const AppBluetoothDeviceTile({
    super.key,
    required this.name,
    required this.address,
    required this.rssi,
    required this.isConnected,
    this.isConnecting = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final signalIcon = rssi > -60
        ? Icons.signal_cellular_alt_rounded
        : rssi > -80
            ? Icons.signal_cellular_alt_2_bar_rounded
            : Icons.signal_cellular_alt_1_bar_rounded;

    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        leading: Icon(
          Icons.bluetooth_connected_rounded,
          color: isConnected ? context.colors.primary : context.colors.onSurface.withOpacity(0.4),
        ),
        title: Text(
          name,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          address,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.4),
          ),
        ),
        trailing: isConnecting
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(signalIcon, size: 16, color: context.colors.onSurface.withOpacity(0.4)),
                  const SizedBox(width: AppTheme.spacing12),
                  Text(
                    isConnected ? 'Connected' : 'Connect',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: isConnected ? AppTheme.successColor : context.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
        onTap: () {
          HapticHelper.lightTap();
          onTap();
        },
      ),
    );
  }
}
