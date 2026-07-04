import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vehicle_intelligence_provider.dart';

class ServiceReminderPage extends ConsumerWidget {
  const ServiceReminderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(serviceReminderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Reminders'),
      ),
      body: remindersAsync.when(
        data: (reminders) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final r = reminders[index];
              return Card(
                child: ListTile(
                  leading: Icon(
                    r.urgency == 'overdue' ? Icons.warning : Icons.build_circle,
                    color: r.urgency == 'overdue' ? Colors.red : Colors.orange,
                  ),
                  title: Text(r.title),
                  subtitle: Text('Due at ${r.dueKm} km'),
                  trailing: Chip(label: Text(r.urgency.toUpperCase())),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
