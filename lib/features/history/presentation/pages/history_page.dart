import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: Text(
          'Scan History',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacing24),
                decoration: BoxDecoration(
                  color: context.colors.primary.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.history_rounded,
                  size: 64,
                  color: context.colors.primary.withOpacity(0.4),
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),
              Text(
                'No History Available',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface,
                ),
              ),
              const SizedBox(height: AppTheme.spacing8),
              Text(
                'Your completed diagnostic scan reports and sensor logs will appear here.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.5),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
