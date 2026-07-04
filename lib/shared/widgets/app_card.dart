import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

enum CardStatus { normal, success, warning, error, info }

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final CardStatus status;
  final Color? backgroundColor;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.status = CardStatus.normal,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = _getBorderSide(context);

    final card = Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.cardTheme.color ?? Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: borderSide != null ? Border.fromBorderSide(borderSide) : null,
        boxShadow: AppTheme.cardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppTheme.spacing16),
            child: child,
          ),
        ),
      ),
    );

    return card;
  }

  BorderSide? _getBorderSide(BuildContext context) {
    switch (status) {
      case CardStatus.normal:
        return null;
      case CardStatus.success:
        return BorderSide(color: AppTheme.successColor.withOpacity(0.5), width: 1.5);
      case CardStatus.warning:
        return BorderSide(color: AppTheme.tertiaryColor.withOpacity(0.5), width: 1.5);
      case CardStatus.error:
        return BorderSide(color: AppTheme.errorColor.withOpacity(0.5), width: 1.5);
      case CardStatus.info:
        return BorderSide(color: context.colors.primary.withOpacity(0.5), width: 1.5);
    }
  }
}
