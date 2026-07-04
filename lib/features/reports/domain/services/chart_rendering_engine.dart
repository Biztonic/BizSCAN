class ChartRenderingEngine {
  String generateVectorChartSvg(List<double> seriesData, {String title = 'Telemetry Trend'}) {
    final buffer = StringBuffer();
    buffer.writeln('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 200" width="100%" height="200">');
    buffer.writeln('  <rect width="500" height="200" fill="#0f172a" rx="8" />');
    buffer.writeln('  <text x="20" y="30" fill="#f8fafc" font-size="14" font-weight="bold">$title</text>');

    if (seriesData.isNotEmpty) {
      final points = <String>[];
      final stepX = 460.0 / (seriesData.length > 1 ? seriesData.length - 1 : 1);
      final maxVal = seriesData.reduce((a, b) => a > b ? a : b);
      final minVal = seriesData.reduce((a, b) => a < b ? a : b);
      final range = (maxVal - minVal) > 0 ? (maxVal - minVal) : 1.0;

      for (int i = 0; i < seriesData.length; i++) {
        final x = 20.0 + i * stepX;
        final y = 160.0 - ((seriesData[i] - minVal) / range) * 110.0;
        points.add('${x.toStringAsFixed(1)},${y.toStringAsFixed(1)}');
      }

      buffer.writeln('  <polyline points="${points.join(' ')}" fill="none" stroke="#38bdf8" stroke-width="3" />');
    }

    buffer.writeln('</svg>');
    return buffer.toString();
  }
}
