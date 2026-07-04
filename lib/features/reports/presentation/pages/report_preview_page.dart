import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/diagnostic_report.dart';

class ReportPreviewPage extends ConsumerWidget {
  final DiagnosticReport report;
  const ReportPreviewPage({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report ${report.reportNumber}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BizSCAN Diagnostic Report', style: Theme.of(context).textTheme.titleLarge),
                  Text('Status: ${report.reportStatus}'),
                  Text('Vehicle ID: ${report.vehicleId}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Report Sections', style: Theme.of(context).textTheme.titleMedium),
          ...report.sections.map((s) => Card(
                child: ListTile(
                  title: Text(s.title),
                  subtitle: Text('Type: ${s.type.name}'),
                  trailing: Icon(s.enabled ? Icons.check_box : Icons.check_box_outline_blank),
                ),
              )),
        ],
      ),
    );
  }
}
