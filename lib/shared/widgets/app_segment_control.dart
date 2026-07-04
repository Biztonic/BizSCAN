import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/utils/haptic_helper.dart';

class AppSegmentControl<T> extends StatelessWidget {
  final List<T> segments;
  final T selectedSegment;
  final String Function(T) labelBuilder;
  final void Function(T) onSegmentSelected;

  const AppSegmentControl({
    super.key,
    required this.segments,
    required this.selectedSegment,
    required this.labelBuilder,
    required this.onSegmentSelected,
  });

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = segments.indexOf(selectedSegment);

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacing4),
      decoration: BoxDecoration(
        color: context.colors.onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double segmentWidth = constraints.maxWidth / segments.length;

          return Stack(
            children: [
              // Animated background slider
              AnimatedPositioned(
                duration: AppTheme.durationMedium,
                curve: Curves.easeInOutCubic,
                left: selectedIndex * segmentWidth,
                top: 0,
                bottom: 0,
                width: segmentWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.cardTheme.color ?? context.colors.surface,
                    borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                    boxShadow: AppTheme.cardShadow,
                  ),
                ),
              ),

              // Clicking overlay buttons
              Row(
                children: List.generate(
                  segments.length,
                  (index) {
                    final segment = segments[index];
                    final isSelected = segment == selectedSegment;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          HapticHelper.lightTap();
                          onSegmentSelected(segment);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: AppTheme.durationFast,
                            style: context.textTheme.labelLarge!.copyWith(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? context.colors.primary : context.colors.onSurface.withOpacity(0.6),
                            ),
                            child: Text(labelBuilder(segment)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
