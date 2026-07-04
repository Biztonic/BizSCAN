import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';
import 'app_chip_badge.dart';

class AppInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  final VoidCallback? onTap;

  const AppInfoCard({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.cardPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) ...[
                Icon(icon, color: context.colors.primary, size: 24),
                const SizedBox(width: AppTheme.spacing16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppTheme.spacing8),
                    Text(
                      content,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppVehicleCard extends StatelessWidget {
  final String makeModel;
  final String vin;
  final String protocol;
  final bool isConnected;
  final VoidCallback? onTap;

  const AppVehicleCard({
    super.key,
    required this.makeModel,
    required this.vin,
    required this.protocol,
    required this.isConnected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppTheme.elevationLow,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppTheme.spacing8),
                        decoration: BoxDecoration(
                          color: context.colors.primary.withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.directions_car_rounded, color: context.colors.primary, size: 24),
                      ),
                      const SizedBox(width: AppTheme.spacing12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            makeModel,
                            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'VIN: $vin',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colors.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppBadge(
                    label: isConnected ? 'Connected' : 'Disconnected',
                    style: isConnected ? BadgeStyle.success : BadgeStyle.error,
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing16),
              const Divider(),
              const SizedBox(height: AppTheme.spacing8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Protocol',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurface.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    protocol,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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

class AppHealthCard extends StatelessWidget {
  final int score;
  final String status;
  final String description;
  final VoidCallback? onScanPressed;

  const AppHealthCard({
    super.key,
    required this.score,
    required this.status,
    required this.description,
    this.onScanPressed,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return Card(
      elevation: AppTheme.elevationLow,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.cardPadding),
        child: Column(
          children: [
            Row(
              children: [
                // Radial Score Circle
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: score / 100.0,
                        strokeWidth: 6.0,
                        backgroundColor: context.colors.outline.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                    Text(
                      '$score',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppTheme.spacing20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Health Assessment',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacing4),
                      Text(
                        status,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacing4),
                      Text(
                        description,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withOpacity(0.6),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (onScanPressed != null) ...[
              const SizedBox(height: AppTheme.spacing16),
              const Divider(),
              const SizedBox(height: AppTheme.spacing12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: onScanPressed,
                  icon: const Icon(Icons.flash_on_rounded, size: 18),
                  label: const Text('Diagnose Live Scanner'),
                  style: FilledButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    if (score >= 90) return AppTheme.healthExcellent;
    if (score >= 75) return AppTheme.healthGood;
    if (score >= 50) return AppTheme.healthWarning;
    return AppTheme.healthCritical;
  }
}

class AppMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color? activeColor;

  const AppMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = activeColor ?? context.colors.primary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacing8),
                  decoration: BoxDecoration(
                    color: themeColor.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: themeColor, size: 20),
                ),
                Text(
                  unit,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
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
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
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

class AppConnectionCard extends StatelessWidget {
  final String title;
  final String status;
  final IconData icon;
  final Color statusColor;
  final bool isConnecting;
  final VoidCallback? onTap;

  const AppConnectionCard({
    super.key,
    required this.title,
    required this.status,
    required this.icon,
    required this.statusColor,
    this.isConnecting = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.cardPadding),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: statusColor, size: 24),
                  ),
                  if (isConnecting)
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: AppTheme.spacing16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacing4),
                    Text(
                      status,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AppGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(AppTheme.opacityGlass),
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: AppTheme.borderThin,
        ),
        boxShadow: AppTheme.glassShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppTheme.cardPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AppGradientCard extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AppGradientCard({
    super.key,
    required this.child,
    this.gradient = AppTheme.premiumGradient,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        boxShadow: AppTheme.softShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppTheme.cardPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AppRecommendationCard extends StatelessWidget {
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onTap;
  final bool isHighPriority;

  const AppRecommendationCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onTap,
    this.isHighPriority = false,
  });

  @override
  Widget build(BuildContext context) {
    final accentColor = isHighPriority ? AppTheme.errorColor : context.colors.primary;

    return Card(
      elevation: AppTheme.elevationLow,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isHighPriority ? Icons.report_problem_rounded : Icons.tips_and_updates_rounded,
                  color: accentColor,
                  size: 24,
                ),
                const SizedBox(width: AppTheme.spacing12),
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface.withOpacity(0.7),
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppTheme.spacing16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      actionLabel,
                      style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: AppTheme.spacing4),
                    Icon(Icons.arrow_forward_rounded, size: 16, color: accentColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
