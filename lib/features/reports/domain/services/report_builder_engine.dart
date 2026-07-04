import '../models/customer_information.dart';
import '../models/diagnostic_report.dart';
import '../models/report_template.dart';
import '../models/workshop_information.dart';

class ReportBuilderEngine {
  DiagnosticReport buildReport({
    required String vehicleId,
    required String sessionId,
    required ReportTemplate template,
    CustomerInformation? customerInfo,
    WorkshopInformation? workshopInfo,
    List<String> dtcs = const [],
  }) {
    final now = DateTime.now();
    final reportNo = 'REP-${now.millisecondsSinceEpoch.toString().substring(5)}';

    return DiagnosticReport(
      reportId: 'REP_$sessionId',
      vehicleId: vehicleId,
      sessionId: sessionId,
      reportNumber: reportNo,
      generatedAt: now,
      customerInfo: customerInfo,
      workshopInfo: workshopInfo,
      sections: template.sections,
      reportStatus: 'draft',
    );
  }
}
