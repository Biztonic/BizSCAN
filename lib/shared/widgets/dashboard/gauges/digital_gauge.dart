import 'package:flutter/material.dart';

class DigitalGauge extends StatelessWidget {
  final double value;
  final String label;
  final String unit;
  final double warningThreshold;
  final double criticalThreshold;

  const DigitalGauge({
    super.key,
    required this.value,
    required this.label,
    required this.unit,
    this.warningThreshold = 80,
    this.criticalThreshold = 95,
  });

  @override
  Widget build(BuildContext context) {
    Color valColor = Theme.of(context).colorScheme.primary;
    if (value >= criticalThreshold) {
      valColor = Theme.of(context).colorScheme.error;
    } else if (value >= warningThreshold) {
      valColor = Colors.orangeAccent;
    }

    return Semantics(
      label: '$label: ${value.toStringAsFixed(1)} $unit',
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: valColor,
                      ),
                ),
                const SizedBox(width: 4),
                Text(unit, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
