import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/reports/domain/models/diagnostic_report.dart';
import 'package:bizscan/features/reports/presentation/pages/report_dashboard_page.dart';
import 'package:bizscan/features/reports/presentation/pages/report_preview_page.dart';
import 'package:bizscan/features/reports/presentation/providers/report_provider.dart';

void main() {
  group('Diagnostic Reports UI Widget Tests', () {
    testWidgets('ReportDashboardPage renders template section and title', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            allReportsProvider.overrideWith((ref) async => []),
          ],
          child: const MaterialApp(
            home: ReportDashboardPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Diagnostic Reports'), findsOneWidget);
      expect(find.text('Report Templates'), findsOneWidget);
    });

    testWidgets('ReportPreviewPage renders report details', (tester) async {
      final sampleReport = DiagnosticReport(
        reportId: 'REP_WIDGET_TEST',
        vehicleId: 'VEH_123',
        sessionId: 'SESS_123',
        reportNumber: 'REP-99999',
        generatedAt: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ReportPreviewPage(report: sampleReport),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Report REP-99999'), findsOneWidget);
      expect(find.text('BizSCAN Diagnostic Report'), findsOneWidget);
    });
  });
}
