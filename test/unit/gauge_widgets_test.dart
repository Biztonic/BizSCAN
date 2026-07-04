import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/shared/widgets/dashboard/gauges/circular_gauge.dart';
import 'package:bizscan/shared/widgets/dashboard/gauges/digital_gauge.dart';

void main() {
  group('Gauge Widgets Unit & Widget Tests', () {
    testWidgets('CircularGauge renders value and label semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CircularGauge(
              value: 75,
              label: 'Battery',
              unit: 'V',
            ),
          ),
        ),
      );

      expect(find.text('Battery'), findsOneWidget);
      expect(find.text('75'), findsOneWidget);
      expect(find.byType(CircularGauge), findsOneWidget);
    });

    testWidgets('DigitalGauge renders value and unit label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DigitalGauge(
              value: 12.4,
              label: 'Voltage',
              unit: 'V',
            ),
          ),
        ),
      );

      expect(find.text('Voltage'), findsOneWidget);
      expect(find.text('12.4'), findsOneWidget);
      expect(find.text('V'), findsOneWidget);
    });
  });
}
