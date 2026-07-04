import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/models/vehicle_profile.dart';
import 'package:bizscan/features/vehicle_intelligence/presentation/pages/vehicle_profile_page.dart';
import 'package:bizscan/features/vehicle_intelligence/presentation/providers/vehicle_intelligence_provider.dart';

void main() {
  group('Vehicle Intelligence Pages Widget Tests', () {
    testWidgets('VehicleProfilePage displays active vehicle profile attributes', (tester) async {
      final sampleVehicle = VehicleProfile(
        vehicleId: 'VEH_TEST',
        vin: '1HGCR2F83HA000000',
        manufacturer: 'Honda Motor Co.',
        brand: 'Honda',
        model: 'Civic LX',
        modelYear: 2017,
        engineCode: 'R18A',
        countryOfOrigin: 'United States',
        createdAt: DateTime.now(),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentVehicleProvider.overrideWith((ref) async => sampleVehicle),
          ],
          child: const MaterialApp(
            home: VehicleProfilePage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Vehicle Profile'), findsOneWidget);
      expect(find.text('Honda Civic LX'), findsOneWidget);
      expect(find.text('VIN: 1HGCR2F83HA000000'), findsOneWidget);
      expect(find.text('Honda Motor Co.'), findsOneWidget);
    });
  });
}
