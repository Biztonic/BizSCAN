import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vehicle_intelligence_provider.dart';

class MaintenanceSchedulePage extends ConsumerWidget {
  const MaintenanceSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduler = ref.watch(maintenanceSchedulerProvider);
    final schedules = scheduler.getDefaultSchedules();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Schedule'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final s = schedules[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${s.description}\nInterval: ${s.intervalKm} km / ${s.intervalMonths} mos'),
              isThreeLine: true,
              trailing: Text(s.estimatedCost, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
