import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/reports/domain/models/diagnostic_report.dart';

import 'package:bizscan/features/reports/domain/services/csv_exporter.dart';
import 'package:bizscan/features/reports/domain/services/digital_signature_engine.dart';
import 'package:bizscan/features/reports/domain/services/html_generator.dart';
import 'package:bizscan/features/reports/domain/services/json_exporter.dart';
import 'package:bizscan/features/reports/domain/services/pdf_generator.dart';
import 'package:bizscan/features/reports/domain/services/qr_verification_engine.dart';

void main() {
  group('Exporters & Verification Generators Unit Tests', () {
    late HTMLGenerator htmlGenerator;
    late CSVExporter csvExporter;
    late JSONExporter jsonExporter;
    late PDFGenerator pdfGenerator;
    late QRVerificationEngine qrEngine;
    late DigitalSignatureEngine sigEngine;

    late DiagnosticReport sampleReport;

    setUp(() {
      htmlGenerator = HTMLGenerator();
      csvExporter = CSVExporter();
      jsonExporter = JSONExporter();
      pdfGenerator = PDFGenerator();
      qrEngine = QRVerificationEngine();
      sigEngine = DigitalSignatureEngine();

      sampleReport = DiagnosticReport(
        reportId: 'REP_TEST',
        vehicleId: 'VEH_TEST',
        sessionId: 'SESS_TEST',
        reportNumber: 'REP-12345',
        generatedAt: DateTime.now(),
      );
    });

    test('HTMLGenerator produces valid HTML markup with report number', () {
      final html = htmlGenerator.generateHTML(sampleReport);
      expect(html, contains('<!DOCTYPE html>'));
      expect(html, contains('REP-12345'));
    });

    test('CSVExporter exports telemetry data with headers', () {
      final telemetry = [
        {'timestamp': '2026-07-04T12:00:00', 'RPM': 750, 'Speed': 0, 'Voltage': 14.2},
      ];
      final csv = csvExporter.exportTelemetryCsv(telemetry);
      expect(csv, contains('Timestamp,RPM,Speed,CoolantTemp,BatteryVoltage,FuelTrim'));
      expect(csv, contains('750'));
    });

    test('JSONExporter performs exact round-trip serialization and deserialization', () {
      final jsonStr = jsonExporter.exportJson(sampleReport);
      final imported = jsonExporter.importJson(jsonStr);

      expect(imported.reportId, sampleReport.reportId);
      expect(imported.reportNumber, sampleReport.reportNumber);
    });

    test('PDFGenerator generates PDF buffer header', () async {
      final pdf = await pdfGenerator.generatePdf(sampleReport);
      expect(pdf, contains('%PDF-1.4 Header'));
    });

    test('QRVerificationEngine builds cryptographic SHA-256 payload and verifies it', () {
      final payload = qrEngine.generateVerificationPayload(
        reportId: sampleReport.reportId,
        vin: '1HGCR2F85HA000000',
        vehicleId: sampleReport.vehicleId,
        timestamp: sampleReport.generatedAt,
      );

      expect(payload, contains('BIZSCAN_VERIFY://'));
      expect(payload, contains('&hash='));
      expect(qrEngine.verifyPayload(payload), true);
    });

    test('DigitalSignatureEngine signs report with SHA-256 hash and verifies integrity', () {
      final signed = sigEngine.signReport(
        report: sampleReport,
        technicianSig: 'Tech John Doe',
        customerSig: 'Customer Jane Smith',
      );

      expect(signed.reportStatus, 'signed');
      expect(signed.digitalHash.isNotEmpty, true);
      expect(sigEngine.verifySignatureIntegrity(signed), true);
    });
  });
}
