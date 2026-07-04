import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/dashboard/presentation/widgets/layout/responsive_dashboard_grid.dart';

void main() {
  group('ResponsiveDashboardGrid Unit & Widget Tests', () {
    testWidgets('ResponsiveDashboardGrid renders grid items', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveDashboardGrid(
              children: [
                Text('Widget 1'),
                Text('Widget 2'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Widget 1'), findsOneWidget);
      expect(find.text('Widget 2'), findsOneWidget);
    });
  });
}
