import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/reports/domain/services/report_builder_engine.dart';
import 'package:bizscan/features/reports/domain/services/report_template_engine.dart';

void main() {
  group('ReportBuilderEngine & Template Unit Tests', () {
    late ReportTemplateEngine templateEngine;
    late ReportBuilderEngine builderEngine;

    setUp(() {
      templateEngine = ReportTemplateEngine();
      builderEngine = ReportBuilderEngine();
    });

    test('ReportTemplateEngine returns prebuilt workshop, fleet, and customer templates', () {
      final templates = templateEngine.getStandardTemplates();
      expect(templates.length, 3);
      expect(templates.any((t) => t.templateId == 'TPL_WORKSHOP'), true);
      expect(templates.any((t) => t.templateId == 'TPL_FLEET'), true);
    });

    test('ReportBuilderEngine creates complete DiagnosticReport object from template', () {
      final template = templateEngine.getStandardTemplates().first;
      final report = builderEngine.buildReport(
        vehicleId: 'VEH_123',
        sessionId: 'SESS_456',
        template: template,
      );

      expect(report.reportId, 'REP_SESS_456');
      expect(report.vehicleId, 'VEH_123');
      expect(report.sections.length, template.sections.length);
      expect(report.reportStatus, 'draft');
    });
  });
}
