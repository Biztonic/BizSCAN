import '../models/report_section.dart';
import '../models/report_template.dart';

class ReportTemplateEngine {
  List<ReportTemplate> getStandardTemplates() {
    return const [
      ReportTemplate(
        templateId: 'TPL_WORKSHOP',
        templateName: 'Professional Workshop Template',
        theme: 'dark_blue',
        pageSize: 'A4',
        orientation: 'portrait',
        showLogo: true,
        showQRCode: true,
        sections: [
          ReportSection(sectionId: 'SEC_1', type: ReportSectionType.vehicleInfo, title: 'Vehicle Specifications', sortOrder: 1),
          ReportSection(sectionId: 'SEC_2', type: ReportSectionType.healthScore, title: 'Vehicle Health Index', sortOrder: 2),
          ReportSection(sectionId: 'SEC_3', type: ReportSectionType.dtcList, title: 'Diagnostic Trouble Codes (DTC)', sortOrder: 3),
          ReportSection(sectionId: 'SEC_4', type: ReportSectionType.liveTelemetry, title: 'Live Sensor Telemetry', sortOrder: 4),
          ReportSection(sectionId: 'SEC_5', type: ReportSectionType.recommendations, title: 'Maintenance & Repair Action Items', sortOrder: 5),
        ],
      ),
      ReportTemplate(
        templateId: 'TPL_FLEET',
        templateName: 'Fleet Management Audit Template',
        theme: 'modern_slate',
        pageSize: 'A4',
        orientation: 'portrait',
        showLogo: true,
        showQRCode: true,
        sections: [
          ReportSection(sectionId: 'SEC_1', type: ReportSectionType.vehicleInfo, title: 'Asset Information', sortOrder: 1),
          ReportSection(sectionId: 'SEC_2', type: ReportSectionType.healthScore, title: 'Health Score', sortOrder: 2),
          ReportSection(sectionId: 'SEC_3', type: ReportSectionType.maintenance, title: 'Service Schedule Compliance', sortOrder: 3),
        ],
      ),
      ReportTemplate(
        templateId: 'TPL_CUSTOMER',
        templateName: 'Customer Plain English Summary',
        theme: 'clean_light',
        pageSize: 'A4',
        orientation: 'portrait',
        showLogo: true,
        showQRCode: true,
        sections: [
          ReportSection(sectionId: 'SEC_1', type: ReportSectionType.vehicleInfo, title: 'Vehicle Info', sortOrder: 1),
          ReportSection(sectionId: 'SEC_2', type: ReportSectionType.diagnosticSummary, title: 'Diagnostic Executive Summary', sortOrder: 2),
          ReportSection(sectionId: 'SEC_3', type: ReportSectionType.recommendations, title: 'Recommended Maintenance', sortOrder: 3),
        ],
      ),
    ];
  }
}
