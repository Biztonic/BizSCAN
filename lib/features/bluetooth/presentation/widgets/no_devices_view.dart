import 'package:flutter/material.dart';

class NoDevicesView extends StatelessWidget {
  final VoidCallback onStartScan;

  const NoDevicesView({super.key, required this.onStartScan});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bluetooth_searching_rounded,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No Devices Found',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ensure your OBD-II adapter (ELM327 / HC-05) is plugged into your vehicle port and powered on.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: onStartScan,
              icon: const Icon(Icons.search_rounded),
              label: const Text('Scan Now'),
            ),
          ],
        ),
      ),
    );
  }
}
