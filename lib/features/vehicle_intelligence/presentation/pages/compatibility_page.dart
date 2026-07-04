import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vehicle_intelligence_provider.dart';

class CompatibilityPage extends ConsumerWidget {
  const CompatibilityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compatAsync = ref.watch(compatibilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('OBD-II Compatibility'),
      ),
      body: compatAsync.when(
        data: (profile) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Supported PIDs', style: Theme.of(context).textTheme.titleMedium),
              ...profile.supportedPIDs.map((pid) => ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(pid),
                  )),
              const Divider(),
              Text('Diagnostic Modes', style: Theme.of(context).textTheme.titleMedium),
              ...profile.supportedDiagnosticModes.map((mode) => ListTile(
                    leading: const Icon(Icons.flash_on, color: Colors.blue),
                    title: Text(mode),
                  )),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
