import 'dart:math';
import 'package:flutter/material.dart';

class CircularGauge extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final String label;
  final String unit;
  final double warningThreshold;
  final double criticalThreshold;

  const CircularGauge({
    super.key,
    required this.value,
    this.minValue = 0,
    this.maxValue = 100,
    required this.label,
    required this.unit,
    this.warningThreshold = 80,
    this.criticalThreshold = 95,
  });

  Color _getColor(BuildContext context) {
    if (value >= criticalThreshold) return Theme.of(context).colorScheme.error;
    if (value >= warningThreshold) return Colors.orangeAccent;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = _getColor(context);
    final clampedVal = value.clamp(minValue, maxValue);
    final progress = (clampedVal - minValue) / (maxValue - minValue);

    return Semantics(
      label: '$label: ${value.toStringAsFixed(1)} $unit',
      value: '${value.toStringAsFixed(1)} $unit',
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            SizedBox(
              width: 100,
              height: 100,
              child: CustomPaint(
                painter: _GaugePainter(progress: progress, color: activeColor),
                child: Center(
                  child: Text(
                    value.toStringAsFixed(0),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: activeColor,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(unit, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double progress;
  final Color color;

  _GaugePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    const startAngle = 135 * (pi / 180);
    const sweepAngle = 270 * (pi / 180);

    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, false, bgPaint);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle * progress, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
