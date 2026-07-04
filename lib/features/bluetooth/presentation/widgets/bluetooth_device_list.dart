import 'package:flutter/material.dart';
import '../../domain/models/bluetooth_device_model.dart';

class BluetoothDeviceList extends StatelessWidget {
  final List<BluetoothDeviceModel> devices;
  final String? connectingAddress;
  final ValueChanged<BluetoothDeviceModel> onDeviceTap;

  const BluetoothDeviceList({
    super.key,
    required this.devices,
    this.connectingAddress,
    required this.onDeviceTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: devices.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final device = devices[index];
        final isConnecting = connectingAddress == device.address;

        return Card(
          elevation: device.isConnected ? 2 : 0,
          color: device.isConnected
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
              : theme.colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: device.isConnected
                  ? theme.colorScheme.primary
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: device.isPaired
                  ? theme.colorScheme.primary.withValues(alpha: 0.15)
                  : theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                device.isPaired ? Icons.bluetooth_connected_rounded : Icons.bluetooth_rounded,
                color: device.isPaired ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
              ),
            ),
            title: Text(
              device.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  device.address,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (device.isPaired) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'PAIRED',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Icon(
                      Icons.signal_cellular_alt_rounded,
                      size: 14,
                      color: _getSignalColor(device.rssi, theme),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${device.rssi} dBm',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: isConnecting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  )
                : FilledButton.tonal(
                    onPressed: () => onDeviceTap(device),
                    child: Text(device.isConnected ? 'Connected' : 'Connect'),
                  ),
          ),
        );
      },
    );
  }

  Color _getSignalColor(int rssi, ThemeData theme) {
    if (rssi >= -60) return Colors.green;
    if (rssi >= -80) return Colors.orange;
    return theme.colorScheme.error;
  }
}
