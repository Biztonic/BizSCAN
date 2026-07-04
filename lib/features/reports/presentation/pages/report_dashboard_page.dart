import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/report_provider.dart';

class ReportDashboardPage extends ConsumerWidget {
  const ReportDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsync = ref.watch(allReportsProvider);
    final templates = ref.watch(templateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic Reports'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Report Templates', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: templates.length,
              itemBuilder: (context, index) {
                final t = templates[index];
                return Card(
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.templateName, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2),
                        const Spacer(),
                        Text('${t.sections.length} Sections', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text('Generated Reports History', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          reportsAsync.when(
            data: (reports) {
              if (reports.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: Text('No diagnostic reports generated yet')),
                  ),
                );
              }
              return Column(
                children: reports.map((r) => ListTile(
                  title: Text(r.reportNumber),
                  subtitle: Text('Status: ${r.reportStatus.toUpperCase()}'),
                  trailing: const Icon(Icons.chevron_right),
                )).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ],
      ),
    );
  }
}
