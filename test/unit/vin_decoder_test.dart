import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/vin_checksum_validator.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/vin_decoder_engine.dart';
import 'package:bizscan/features/vehicle_intelligence/domain/services/wmi_database.dart';

void main() {
  group('VIN Intelligence & Decoder Unit Tests', () {
    late VinChecksumValidator validator;
    late WmiDatabase wmiDatabase;
    late VinDecoderEngine decoder;

    setUp(() {
      validator = VinChecksumValidator();
      wmiDatabase = WmiDatabase();
      decoder = VinDecoderEngine();
    });

    test('VinChecksumValidator validates correct ISO 3779 checksums and rejects invalid characters', () {
      // Valid Honda USA VIN with matching check digit '5'
      expect(validator.isValidVin('1HGCR2F85HA000000'), true);
      // Invalid VIN containing 'I'
      expect(validator.isValidVin('1HGCR2F85IA000000'), false);
      // Short VIN
      expect(validator.isValidVin('1HGCR2F85'), false);
    });

    test('WmiDatabase decodes 3-character WMI records accurately', () {
      final rec1 = wmiDatabase.lookup('1HGCR2F85HA000000');
      expect(rec1?.manufacturer, 'Honda Motor Co.');
      expect(rec1?.brand, 'Honda');
      expect(rec1?.country, 'United States');

      final rec2 = wmiDatabase.lookup('MA3FBA12S00100000');
      expect(rec2?.brand, 'Maruti Suzuki');
      expect(rec2?.country, 'India');
    });

    test('VinDecoderEngine decodes complete 17-digit VIN into VehicleProfile', () {
      final res = decoder.decodeVin('1HGCR2F85HA000000');

      expect(res.isSuccess, true);
      final profile = res.getOrNull!;
      expect(profile.brand, 'Honda');
      expect(profile.modelYear, 2017); // 'H' = 2017
      expect(profile.countryOfOrigin, 'United States');
    });

    test('VinDecoderEngine returns failure on short VIN string', () {
      final res = decoder.decodeVin('SHORT_VIN');
      expect(res.isFailure, true);
    });
  });
}
