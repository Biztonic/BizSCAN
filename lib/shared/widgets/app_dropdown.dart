import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? hint;

  const AppDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: AppTheme.spacing8),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          icon: Icon(Icons.arrow_drop_down_rounded, color: context.colors.primary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.4),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacing16,
              vertical: AppTheme.spacing16,
            ),
            filled: true,
            fillColor: context.colors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.outline.withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.outline.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.primary,
                width: AppTheme.borderMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
