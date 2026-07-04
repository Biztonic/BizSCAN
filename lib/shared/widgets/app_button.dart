import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/utils/haptic_helper.dart';

enum AppButtonStyle { primary, secondary, outlined, text, elevated, gradient }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double height;
  final bool enableHaptics;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style = AppButtonStyle.primary,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = AppTheme.buttonHeightMedium,
    this.enableHaptics = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;

    final Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                style == AppButtonStyle.primary || style == AppButtonStyle.gradient
                    ? context.colors.onPrimary
                    : context.colors.primary,
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacing12),
        ] else if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: AppTheme.spacing8),
        ],
        Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: _getTextColor(context, isEnabled),
          ),
        ),
      ],
    );

    final VoidCallback? tapAction = isEnabled
        ? () {
            if (enableHaptics) {
              HapticHelper.lightTap();
            }
            onPressed!();
          }
        : null;

    if (style == AppButtonStyle.gradient) {
      return Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: isEnabled ? AppTheme.blueNeonGradient : null,
          color: isEnabled ? null : context.colors.onSurface.withOpacity(0.12),
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: isEnabled ? AppTheme.softShadow : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: tapAction,
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            child: Center(child: content),
          ),
        ),
      );
    }

    final Widget button;
    switch (style) {
      case AppButtonStyle.primary:
        button = FilledButton(
          onPressed: tapAction,
          style: FilledButton.styleFrom(
            backgroundColor: context.colors.primary,
            foregroundColor: context.colors.onPrimary,
            disabledBackgroundColor: context.colors.onSurface.withOpacity(0.12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
          ),
          child: content,
        );
        break;
      case AppButtonStyle.secondary:
        button = FilledButton(
          onPressed: tapAction,
          style: FilledButton.styleFrom(
            backgroundColor: context.colors.secondary,
            foregroundColor: context.colors.onSecondary,
            disabledBackgroundColor: context.colors.onSurface.withOpacity(0.12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
          ),
          child: content,
        );
        break;
      case AppButtonStyle.outlined:
        button = OutlinedButton(
          onPressed: tapAction,
          style: OutlinedButton.styleFrom(
            foregroundColor: context.colors.primary,
            side: BorderSide(color: context.colors.outline, width: AppTheme.borderThin),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
          ),
          child: content,
        );
        break;
      case AppButtonStyle.text:
        button = TextButton(
          onPressed: tapAction,
          style: TextButton.styleFrom(
            foregroundColor: context.colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
          ),
          child: content,
        );
        break;
      case AppButtonStyle.elevated:
        button = ElevatedButton(
          onPressed: tapAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.surface,
            foregroundColor: context.colors.primary,
            shadowColor: Colors.black.withOpacity(0.08),
            elevation: AppTheme.elevationLow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
          ),
          child: content,
        );
        break;
      case AppButtonStyle.gradient:
        // Already handled above
        throw UnimplementedError();
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: button,
    );
  }

  Color _getTextColor(BuildContext context, bool isEnabled) {
    if (!isEnabled) {
      return context.colors.onSurface.withOpacity(AppTheme.opacityDisabled);
    }
    switch (style) {
      case AppButtonStyle.primary:
        return context.colors.onPrimary;
      case AppButtonStyle.secondary:
        return context.colors.onSecondary;
      case AppButtonStyle.gradient:
        return Colors.white;
      case AppButtonStyle.outlined:
      case AppButtonStyle.text:
      case AppButtonStyle.elevated:
        return context.colors.primary;
    }
  }
}

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double size;
  final bool enableHaptics;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.size = 40.0,
    this.enableHaptics = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.onSurface.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: size * 0.5,
        icon: Icon(icon, color: iconColor ?? context.colors.primary),
        onPressed: onPressed != null
            ? () {
                if (enableHaptics) {
                  HapticHelper.lightTap();
                }
                onPressed!();
              }
            : null,
      ),
    );
  }
}
