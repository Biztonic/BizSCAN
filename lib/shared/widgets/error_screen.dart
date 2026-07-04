import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;

  const ErrorScreen({
    super.key,
    this.title = 'An Error Occurred',
    required this.message,
    this.onRetry,
    this.retryLabel = 'Try Again',
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
                    color: context.colors.error.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 64,
                    color: context.colors.error,
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
                  message,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.6),
                    height: 1.4,
                  ),
                ),
                if (onRetry != null) ...[
                  const SizedBox(height: AppTheme.spacing32),
                  SizedBox(
                    width: 200,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: onRetry,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.colors.error,
                        side: BorderSide(color: context.colors.error.withOpacity(0.5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                        ),
                      ),
                      child: Text(
                        retryLabel,
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
