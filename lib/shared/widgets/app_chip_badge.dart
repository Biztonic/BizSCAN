import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

enum BadgeStyle { success, warning, error, info, normal }

class AppBadge extends StatelessWidget {
  final String label;
  final BadgeStyle style;
  final bool isOutline;

  const AppBadge({
    super.key,
    required this.label,
    this.style = BadgeStyle.normal,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = _getBgColor(context);
    final Color fgColor = _getFgColor(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing8, vertical: AppTheme.spacing4),
      decoration: BoxDecoration(
        color: isOutline ? Colors.transparent : bgColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: isOutline ? Border.all(color: fgColor, width: AppTheme.borderThin) : null,
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: fgColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Color _getBgColor(BuildContext context) {
    switch (style) {
      case BadgeStyle.normal:
        return context.colors.onSurface.withOpacity(0.08);
      case BadgeStyle.success:
        return AppTheme.successColor.withOpacity(0.12);
      case BadgeStyle.warning:
        return AppTheme.tertiaryColor.withOpacity(0.12);
      case BadgeStyle.error:
        return AppTheme.errorColor.withOpacity(0.12);
      case BadgeStyle.info:
        return context.colors.secondary.withOpacity(0.12);
    }
  }

  Color _getFgColor(BuildContext context) {
    switch (style) {
      case BadgeStyle.normal:
        return context.colors.onSurface.withOpacity(0.7);
      case BadgeStyle.success:
        return AppTheme.successColor;
      case BadgeStyle.warning:
        return AppTheme.tertiaryColor;
      case BadgeStyle.error:
        return AppTheme.errorColor;
      case BadgeStyle.info:
        return context.colors.secondary;
    }
  }
}

class AppChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final void Function(bool)? onSelected;

  const AppChip({
    super.key,
    required this.label,
    this.icon,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = context.colors.primary;
    final inactiveColor = context.colors.outline.withOpacity(0.3);

    return FilterChip(
      label: Text(label),
      avatar: icon != null ? Icon(icon, size: 16) : null,
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: activeColor.withOpacity(0.12),
      checkmarkColor: activeColor,
      backgroundColor: Colors.transparent,
      side: BorderSide(
        color: isSelected ? activeColor : inactiveColor,
        width: AppTheme.borderThin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
      ),
      labelStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? activeColor : context.colors.onSurface.withOpacity(0.7),
      ),
    );
  }
}
