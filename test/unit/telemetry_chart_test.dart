import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/shared/widgets/dashboard/charts/scrolling_telemetry_chart.dart';

void main() {
  group('ScrollingTelemetryChart Unit & Widget Tests', () {
    testWidgets('ScrollingTelemetryChart renders title and pause/resume button', (tester) async {
      final now = DateTime.now();
      final points = [
        TelemetryDataPoint(now.subtract(const Duration(seconds: 10)), 750),
        TelemetryDataPoint(now, 800),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScrollingTelemetryChart(
              dataPoints: points,
              title: 'Engine RPM',
              unit: 'RPM',
            ),
          ),
        ),
      );

      expect(find.text('Engine RPM (RPM)'), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsOneWidget);

      await tester.tap(find.byIcon(Icons.pause));
      await tester.pump();

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });
  });
}
