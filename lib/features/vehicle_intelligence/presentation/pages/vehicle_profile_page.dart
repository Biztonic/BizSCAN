import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vehicle_intelligence_provider.dart';

class VehicleProfilePage extends ConsumerWidget {
  const VehicleProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleAsync = ref.watch(currentVehicleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Profile'),
      ),
      body: vehicleAsync.when(
        data: (vehicle) {
          if (vehicle == null) {
            return const Center(child: Text('No vehicle selected'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${vehicle.brand} ${vehicle.model}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('VIN: ${vehicle.vin}', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Manufacturer'),
                trailing: Text(vehicle.manufacturer),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Model Year'),
                trailing: Text('${vehicle.modelYear}'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Engine Code'),
                trailing: Text(vehicle.engineCode),
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: const Text('Country of Origin'),
                trailing: Text(vehicle.countryOfOrigin),
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
