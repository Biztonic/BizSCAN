import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExportScreenPage extends ConsumerWidget {
  const ExportScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export & Share Report'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: const Text('Export as PDF Document'),
            subtitle: const Text('Multi-page printable report with charts'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.html, color: Colors.blue),
            title: const Text('Export as HTML Page'),
            subtitle: const Text('Responsive web viewable report'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.table_chart, color: Colors.green),
            title: const Text('Export Raw Data as CSV'),
            subtitle: const Text('Telemetry and DTC history spreadsheet'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.code, color: Colors.orange),
            title: const Text('Export Full Session JSON'),
            subtitle: const Text('Diagnostic session archive & backup'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
