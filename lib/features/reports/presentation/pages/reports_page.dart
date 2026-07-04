import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';

class ReportsTab extends StatelessWidget {
  const ReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: Text(
          'Diagnostic Reports',
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
              // Summary Header
              Text(
                'Vehicle Diagnostic Status',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),

              // Overall Health Score (Mock)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacing20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overall Health',
                                style: context.textTheme.titleSmall?.copyWith(
                                  color: context.colors.onSurface.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacing4),
                              Text(
                                'Scan Required',
                                style: context.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.tertiary,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: context.colors.tertiary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.sync_problem_rounded,
                              color: context.colors.tertiary,
                              size: 32,
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
                          Text(
                            'Active Trouble Codes (DTCs)',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onSurface.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            '-- Codes',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Categories Checklist
              Text(
                'Diagnostic Checkpoints',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _CheckpointItem(
                    name: 'Engine Powertrain (P)',
                    status: 'No data',
                    icon: Icons.brightness_auto_rounded,
                  ),
                  _CheckpointItem(
                    name: 'Chassis System (C)',
                    status: 'No data',
                    icon: Icons.build_circle_rounded,
                  ),
                  _CheckpointItem(
                    name: 'Body Electronics (B)',
                    status: 'No data',
                    icon: Icons.electric_car_rounded,
                  ),
                  _CheckpointItem(
                    name: 'Network Communications (U)',
                    status: 'No data',
                    icon: Icons.share_rounded,
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

class _CheckpointItem extends StatelessWidget {
  final String name;
  final String status;
  final IconData icon;

  const _CheckpointItem({
    required this.name,
    required this.status,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        leading: Icon(icon, color: context.colors.primary.withOpacity(0.5)),
        title: Text(
          name,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: context.colors.outline.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          ),
          child: Text(
            status,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
