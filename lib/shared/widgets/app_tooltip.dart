import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const AppTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: context.textTheme.labelMedium?.copyWith(
        color: context.colors.onPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        boxShadow: AppTheme.softShadow,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing12, vertical: AppTheme.spacing8),
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24),
      showDuration: const Duration(seconds: 3),
      triggerMode: TooltipTriggerMode.tap,
      child: child,
    );
  }
}
