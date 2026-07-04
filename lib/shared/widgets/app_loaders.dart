import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppCircularLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const AppCircularLoader({
    super.key,
    this.size = 36.0,
    this.strokeWidth = 3.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? context.colors.primary),
      ),
    );
  }
}

class AppLinearLoader extends StatelessWidget {
  final double? value;
  final Color? color;

  const AppLinearLoader({
    super.key,
    this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 6.0,
        backgroundColor: context.colors.outline.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation<Color>(color ?? context.colors.primary),
      ),
    );
  }
}

class AppShimmer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const AppShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = AppTheme.radiusMedium,
  });

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.theme.brightness == Brightness.dark;
    final baseColor = isDark ? AppTheme.darkShimmerBase : AppTheme.lightShimmerBase;
    final highlightColor = isDark ? AppTheme.darkShimmerHighlight : AppTheme.lightShimmerHighlight;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                0.0,
                (_animation.value.clamp(0.0, 1.0)),
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }
}
