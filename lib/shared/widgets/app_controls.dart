import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/utils/haptic_helper.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      onChanged: onChanged == null
          ? null
          : (val) {
              HapticHelper.lightTap();
              onChanged!(val);
            },
      activeColor: context.colors.primary,
    );
  }
}

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final checkbox = Checkbox(
      value: value,
      onChanged: (val) {
        HapticHelper.lightTap();
        onChanged(val);
      },
      activeColor: context.colors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusExtraSmall),
      ),
    );

    if (label != null) {
      return GestureDetector(
        onTap: () {
          HapticHelper.lightTap();
          onChanged(!value);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            checkbox,
            const SizedBox(width: AppTheme.spacing8),
            Text(label!, style: context.textTheme.bodyMedium),
          ],
        ),
      );
    }

    return checkbox;
  }
}

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String? label;

  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: (val) {
        HapticHelper.lightTap();
        onChanged(val);
      },
      activeColor: context.colors.primary,
    );

    if (label != null) {
      return GestureDetector(
        onTap: () {
          HapticHelper.lightTap();
          onChanged(value);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            radio,
            const SizedBox(width: AppTheme.spacing8),
            Text(label!, style: context.textTheme.bodyMedium),
          ],
        ),
      );
    }

    return radio;
  }
}

class AppSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onChangeEnd;

  const AppSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: context.colors.primary,
        inactiveTrackColor: context.colors.outline.withOpacity(0.3),
        thumbColor: context.colors.primary,
        overlayColor: context.colors.primary.withOpacity(0.12),
        trackHeight: 6.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        onChanged: onChanged,
        onChangeEnd: (val) {
          HapticHelper.mediumTap();
          if (onChangeEnd != null) onChangeEnd!(val);
        },
      ),
    );
  }
}
