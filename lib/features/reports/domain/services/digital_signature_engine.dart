import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../models/diagnostic_report.dart';

class DigitalSignatureEngine {
  String computeReportHash(DiagnosticReport report) {
    final rawData = '${report.reportId}_${report.vehicleId}_${report.reportNumber}_${report.generatedAt.toIso8601String()}';
    final bytes = utf8.encode(rawData);
    return sha256.convert(bytes).toString();
  }

  DiagnosticReport signReport({
    required DiagnosticReport report,
    required String technicianSig,
    required String customerSig,
  }) {
    final hash = computeReportHash(report);
    return report.copyWith(
      technicianSignature: technicianSig,
      customerSignature: customerSig,
      digitalHash: hash,
      reportStatus: 'signed',
    );
  }

  bool verifySignatureIntegrity(DiagnosticReport report) {
    if (report.digitalHash.isEmpty) return false;
    final expectedHash = computeReportHash(report);
    return report.digitalHash == expectedHash;
  }
}
