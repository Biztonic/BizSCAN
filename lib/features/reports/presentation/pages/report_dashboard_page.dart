import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../obd/presentation/providers/obd_provider.dart';
import '../providers/report_provider.dart';

class ReportDashboardPage extends ConsumerStatefulWidget {
  const ReportDashboardPage({super.key});

  @override
  ConsumerState<ReportDashboardPage> createState() => _ReportDashboardPageState();
}

class _ReportDashboardPageState extends ConsumerState<ReportDashboardPage> {
  int _selectedTemplateIndex = 0;
  bool _isScanning = false;

  @override
  Widget build(BuildContext context) {
    final reportsAsync = ref.watch(allReportsProvider);
    final templates = ref.watch(templateProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic Reports'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('1. Choose Report Template', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: templates.length,
              itemBuilder: (context, index) {
                final t = templates[index];
                final isSelected = _selectedTemplateIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTemplateIndex = index;
                    });
                  },
                  child: Card(
                    color: isSelected ? theme.colorScheme.primaryContainer.withOpacity(0.4) : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: isSelected 
                          ? BorderSide(color: theme.colorScheme.primary, width: 2) 
                          : BorderSide.none,
                    ),
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.templateName, 
                            style: const TextStyle(fontWeight: FontWeight.bold), 
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text('${t.sections.length} Sections', style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          
          // Action button to trigger scan & build
          Card(
            color: theme.colorScheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2. Run Diagnostics Scan', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'Connects to the OBD adapter, fetches active trouble codes, evaluates rule engines, and packages a formal diagnostic report.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: _isScanning ? 'Scanning ECU & Generating...' : 'Scan ECU & Generate Report',
                    style: AppButtonStyle.gradient,
                    isLoading: _isScanning,
                    onPressed: _isScanning ? null : () async {
                      setState(() {
                        _isScanning = true;
                      });
                      try {
                        // Watch or read obd values
                        final obdNotifier = ref.read(oBDStateNotifierProvider.notifier);
                        await obdNotifier.connectAndFetch();
                        
                        final obdState = ref.read(oBDStateNotifierProvider);
                        final obdMap = obdState.valueOrNull ?? {};
                        final dtcs = obdMap['dtcs'] as List<String>? ?? const [];
                        
                        final activeTemplate = templates[_selectedTemplateIndex];
                        final generateReport = ref.read(generateReportProvider);
                        await generateReport(template: activeTemplate, dtcs: dtcs);
                        
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Diagnostic report successfully generated and saved!')),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Scan failed: $e. Make sure device is connected.')),
                          );
                        }
                      } finally {
                        setState(() {
                          _isScanning = false;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Generated Reports History', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
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
                children: reports.reversed.map((r) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Icons.description_rounded, color: Colors.blue),
                    title: Text(r.reportNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Status: ${r.reportStatus.toUpperCase()} • ${r.sections.length} Sections'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      // Action to view report details or export
                    },
                  ),
                )).toList(),
              );
            },
            loading: () => const Center(child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            )),
            error: (err, stack) => Text('Error loading history: $err'),
          ),
        ],
      ),
    );
  }
}
