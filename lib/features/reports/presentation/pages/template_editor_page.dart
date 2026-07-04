import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/report_template.dart';

class TemplateEditorPage extends ConsumerWidget {
  final ReportTemplate template;
  const TemplateEditorPage({super.key, required this.template});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Template: ${template.templateName}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Template Settings', style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text('Theme'),
            trailing: Text(template.theme),
          ),
          ListTile(
            title: const Text('Page Size'),
            trailing: Text(template.pageSize),
          ),
          ListTile(
            title: const Text('Show Workshop Logo'),
            trailing: Switch(value: template.showLogo, onChanged: (v) {}),
          ),
          ListTile(
            title: const Text('Show QR Verification Code'),
            trailing: Switch(value: template.showQRCode, onChanged: (v) {}),
          ),
        ],
      ),
    );
  }
}
