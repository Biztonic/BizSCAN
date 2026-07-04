import 'package:flutter/material.dart';

class VehicleHealthCard extends StatelessWidget {
  final int score;
  const VehicleHealthCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.green;
    if (score < 40) {
      statusColor = Colors.red;
    } else if (score < 70) {
      statusColor = Colors.orange;
    }

    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vehicle Health Score', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.health_and_safety, color: statusColor, size: 36),
                const SizedBox(width: 12),
                Text(
                  '$score / 100',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BatteryStatusCard extends StatelessWidget {
  final double voltage;
  const BatteryStatusCard({super.key, required this.voltage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.battery_charging_full),
        title: const Text('Battery System'),
        subtitle: Text('${voltage.toStringAsFixed(1)} V'),
      ),
    );
  }
}

class EngineStatusCard extends StatelessWidget {
  final double rpm;
  const EngineStatusCard({super.key, required this.rpm});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.speed),
        title: const Text('Engine Telemetry'),
        subtitle: Text('${rpm.toStringAsFixed(0)} RPM'),
      ),
    );
  }
}

class ConnectionCard extends StatelessWidget {
  final String status;
  const ConnectionCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.bluetooth),
        title: const Text('Transport Connection'),
        subtitle: Text(status),
      ),
    );
  }
}
