import 'dart:math';
import 'package:flutter/material.dart';

class TelemetryDataPoint {
  final DateTime timestamp;
  final double value;

  const TelemetryDataPoint(this.timestamp, this.value);
}

class ScrollingTelemetryChart extends StatefulWidget {
  final List<TelemetryDataPoint> dataPoints;
  final String title;
  final String unit;
  final int timeWindowSeconds; // 30, 60, 300

  const ScrollingTelemetryChart({
    super.key,
    required this.dataPoints,
    required this.title,
    required this.unit,
    this.timeWindowSeconds = 30,
  });

  @override
  State<ScrollingTelemetryChart> createState() => _ScrollingTelemetryChartState();
}

class _ScrollingTelemetryChartState extends State<ScrollingTelemetryChart> {
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final windowCutoff = now.subtract(Duration(seconds: widget.timeWindowSeconds));

    final visiblePoints = _isPaused
        ? widget.dataPoints
        : widget.dataPoints.where((p) => p.timestamp.isAfter(windowCutoff)).toList();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.title} (${widget.unit})',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
                onPressed: () {
                  setState(() {
                    _isPaused = !_isPaused;
                  });
                },
                tooltip: _isPaused ? 'Resume Chart' : 'Pause Chart',
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomPaint(
              painter: _ChartPainter(
                points: visiblePoints,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<TelemetryDataPoint> points;
  final Color color;

  _ChartPainter({required this.points, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final minVal = points.map((p) => p.value).reduce(min);
    final maxVal = points.map((p) => p.value).reduce(max);
    final range = (maxVal - minVal) == 0 ? 1.0 : (maxVal - minVal);

    final path = Path();
    final stepX = size.width / (points.length - 1);

    for (int i = 0; i < points.length; i++) {
      final x = i * stepX;
      final normalizedY = (points[i].value - minVal) / range;
      final y = size.height - (normalizedY * (size.height - 20) + 10);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ChartPainter oldDelegate) => true;
}
