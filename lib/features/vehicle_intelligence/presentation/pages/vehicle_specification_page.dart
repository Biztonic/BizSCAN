import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vehicle_intelligence_provider.dart';

class VehicleSpecificationPage extends ConsumerWidget {
  const VehicleSpecificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specAsync = ref.watch(vehicleSpecificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacturer Specifications'),
      ),
      body: specAsync.when(
        data: (spec) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.oil_barrel),
                      title: const Text('Engine Oil Capacity'),
                      subtitle: Text(spec.engineOilCapacity),
                    ),
                    ListTile(
                      leading: const Icon(Icons.water_drop),
                      title: const Text('Coolant Capacity'),
                      subtitle: Text(spec.coolantCapacity),
                    ),
                    ListTile(
                      leading: const Icon(Icons.battery_charging_full),
                      title: const Text('Battery Specification'),
                      subtitle: Text(spec.batteryCapacity),
                    ),
                    ListTile(
                      leading: const Icon(Icons.tire_repair),
                      title: const Text('Tyre Pressure (Front / Rear)'),
                      subtitle: Text('${spec.tyrePressureFront} / ${spec.tyrePressureRear}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_gas_station),
                      title: const Text('Fuel Tank Capacity'),
                      subtitle: Text(spec.fuelTankCapacity),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
