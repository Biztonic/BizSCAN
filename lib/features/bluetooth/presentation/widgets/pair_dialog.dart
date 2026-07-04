import 'package:flutter/material.dart';
import '../../domain/models/bluetooth_device_model.dart';

class PairDialog extends StatelessWidget {
  final BluetoothDeviceModel device;
  final VoidCallback onConfirm;

  const PairDialog({
    super.key,
    required this.device,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pair Bluetooth Device'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Do you want to connect to:'),
          const SizedBox(height: 8),
          Text(
            device.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            device.address,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          const Text(
            'Default PIN for OBD-II adapters is usually 1234 or 0000.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: const Text('Connect'),
        ),
      ],
    );
  }
}
