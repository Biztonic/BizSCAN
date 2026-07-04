import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/bluetooth_device_model.dart';
import '../controllers/bluetooth_scanner_controller.dart';
import '../providers/bluetooth_providers.dart';
import '../widgets/bluetooth_device_list.dart';
import '../widgets/bluetooth_disabled_view.dart';
import '../widgets/no_devices_view.dart';
import '../widgets/pair_dialog.dart';
import '../widgets/permission_required_view.dart';

class BluetoothScanPage extends ConsumerStatefulWidget {
  const BluetoothScanPage({super.key});

  @override
  ConsumerState<BluetoothScanPage> createState() => _BluetoothScanPageState();
}

class _BluetoothScanPageState extends ConsumerState<BluetoothScanPage> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  String _searchQuery = '';
  String _filter = 'ALL'; // 'ALL', 'PAIRED', 'UNPAIRED'

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Auto-start scanning on launch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bluetoothScannerControllerProvider.notifier).startScanning();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bluetoothScannerControllerProvider);
    final controller = ref.read(bluetoothScannerControllerProvider.notifier);
    final theme = Theme.of(context);

    // Apply filtering
    final filteredDevices = state.devices.where((d) {
      final matchesSearch = d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.address.toLowerCase().contains(_searchQuery.toLowerCase());
      if (!matchesSearch) return false;
      if (_filter == 'PAIRED') return d.isPaired;
      if (_filter == 'UNPAIRED') return !d.isPaired;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth OBD Scanner'),
        actions: [
          IconButton(
            icon: Icon(state.isScanning ? Icons.stop_rounded : Icons.sync_rounded),
            tooltip: state.isScanning ? 'Stop Scan' : 'Rescan',
            onPressed: () {
              if (state.isScanning) {
                controller.stopScanning();
              } else {
                controller.startScanning();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Status Bar
          Container(
            color: theme.colorScheme.surfaceContainerLow,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (state.isScanning)
                  RotationTransition(
                    turns: _animController,
                    child: Icon(Icons.radar_rounded, color: theme.colorScheme.primary),
                  )
                else
                  Icon(Icons.bluetooth_searching_rounded, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.isScanning ? 'Searching for nearby OBD-II devices...' : 'Discovery Idle',
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Found ${filteredDevices.length} available device(s)',
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Search & Filter Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search device name or MAC...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: theme.colorScheme.surfaceContainerHighest,
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val),
                  ),
                ),
                const SizedBox(width: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'ALL', label: Text('All')),
                    ButtonSegment(value: 'PAIRED', label: Text('Paired')),
                  ],
                  selected: {_filter},
                  onSelectionChanged: (val) {
                    setState(() => _filter = val.first);
                  },
                ),
              ],
            ),
          ),

          // Body Views
          Expanded(
            child: _buildBody(state, controller, filteredDevices),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
    BluetoothScannerState state,
    BluetoothScannerController controller,
    List<BluetoothDeviceModel> filteredDevices,
  ) {
    if (!state.isBluetoothEnabled) {
      return BluetoothDisabledView(
        onRefresh: () => controller.startScanning(),
      );
    }

    if (!state.hasPermission) {
      return PermissionRequiredView(
        onRequestPermissions: () => controller.checkAndRequestPermissions(),
      );
    }

    if (filteredDevices.isEmpty && !state.isScanning) {
      return NoDevicesView(
        onStartScan: () => controller.startScanning(),
      );
    }

    return BluetoothDeviceList(
      devices: filteredDevices,
      connectingAddress: state.connectingAddress,
      onDeviceTap: (device) {
        showDialog(
          context: context,
          builder: (_) => PairDialog(
            device: device,
            onConfirm: () => controller.connectToDevice(device),
          ),
        );
      },
    );
  }
}
