import 'package:flutter/material.dart';

class LinearGauge extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final String label;
  final String unit;

  const LinearGauge({
    super.key,
    required this.value,
    this.minValue = 0,
    this.maxValue = 100,
    required this.label,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);

    return Semantics(
      label: '$label: ${value.toStringAsFixed(1)} $unit',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              Text('${value.toStringAsFixed(1)} $unit', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
