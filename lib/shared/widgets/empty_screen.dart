import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class EmptyScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const EmptyScreen({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: Center(
        child: SingleChildScrollView(
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
                    height: 1.4,
                  ),
                ),
                if (actionLabel != null && onActionPressed != null) ...[
                  const SizedBox(height: AppTheme.spacing32),
                  SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: onActionPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        foregroundColor: context.colors.onPrimary,
                        elevation: AppTheme.elevationNone,
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
      ),
    );
  }
}
