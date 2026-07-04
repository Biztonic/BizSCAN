import '../models/diagnostic_report.dart';

class CSVExporter {
  String exportTelemetryCsv(List<Map<String, dynamic>> telemetryFrames) {
    final buffer = StringBuffer();
    buffer.writeln('Timestamp,RPM,Speed,CoolantTemp,BatteryVoltage,FuelTrim');

    for (final frame in telemetryFrames) {
      buffer.writeln(
        '${frame['timestamp']},${frame['RPM'] ?? ''},${frame['Speed'] ?? ''},${frame['CoolantTemp'] ?? ''},${frame['Voltage'] ?? ''},${frame['FuelTrim'] ?? ''}',
      );
    }

    return buffer.toString();
  }

  String exportReportSummaryCsv(DiagnosticReport report) {
    final buffer = StringBuffer();
    buffer.writeln('ReportNumber,VehicleID,SessionID,GeneratedAt,Status');
    buffer.writeln('${report.reportNumber},${report.vehicleId},${report.sessionId},${report.generatedAt.toIso8601String()},${report.reportStatus}');
    return buffer.toString();
  }
}
