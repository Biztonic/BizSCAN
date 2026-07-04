import '../models/diagnostic_report.dart';

class HTMLGenerator {
  String generateHTML(DiagnosticReport report) {
    final buffer = StringBuffer();
    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html lang="en">');
    buffer.writeln('<head>');
    buffer.writeln('  <meta charset="UTF-8">');
    buffer.writeln('  <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    buffer.writeln('  <title>BizSCAN Report - ${report.reportNumber}</title>');
    buffer.writeln('  <style>');
    buffer.writeln('    body { font-family: system-ui, sans-serif; margin: 20px; color: #1a1a1a; background: #f8fafc; }');
    buffer.writeln('    .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 20px; }');
    buffer.writeln('    .header { display: flex; justify-content: space-between; border-bottom: 2px solid #0284c7; padding-bottom: 10px; }');
    buffer.writeln('    .badge { background: #0284c7; color: white; padding: 4px 8px; border-radius: 4px; font-weight: bold; }');
    buffer.writeln('  </style>');
    buffer.writeln('</head>');
    buffer.writeln('<body>');
    buffer.writeln('  <div class="card header">');
    buffer.writeln('    <div>');
    buffer.writeln('      <h1>BizSCAN Diagnostic Report</h1>');
    buffer.writeln('      <p>Report Number: <strong>${report.reportNumber}</strong></p>');
    buffer.writeln('    </div>');
    buffer.writeln('    <div style="text-align: right;">');
    buffer.writeln('      <span class="badge">${report.reportStatus.toUpperCase()}</span>');
    buffer.writeln('      <p>Date: ${report.generatedAt.toIso8601String().substring(0, 10)}</p>');
    buffer.writeln('    </div>');
    buffer.writeln('  </div>');

    if (report.workshopInfo != null) {
      buffer.writeln('  <div class="card">');
      buffer.writeln('    <h3>Workshop: ${report.workshopInfo!.workshopName}</h3>');
      buffer.writeln('    <p>Technician: ${report.workshopInfo!.technicianName}</p>');
      buffer.writeln('  </div>');
    }

    buffer.writeln('  <div class="card">');
    buffer.writeln('    <h3>Sections</h3>');
    buffer.writeln('    <ul>');
    for (final sec in report.sections) {
      buffer.writeln('      <li>${sec.title}</li>');
    }
    buffer.writeln('    </ul>');
    buffer.writeln('  </div>');

    buffer.writeln('</body>');
    buffer.writeln('</html>');

    return buffer.toString();
  }
}
