import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/data/parsers/default_response_parser.dart';
import 'package:bizscan/features/obd/domain/models/obd_command.dart';

void main() {
  group('DefaultResponseParser Unit Tests', () {
    late DefaultResponseParser parser;

    setUp(() {
      parser = DefaultResponseParser();
    });

    test('decodeHex should clean whitespace and convert to uppercase', () {
      final res = parser.decodeHex('41 0c 0b f4\r\n');
      expect(res.isSuccess, true);
      expect(res.getOrNull, '410C0BF4');
    });

    test('parsePidResponse should accurately calculate RPM (010C)', () {
      // 41 0C 0B F4 -> ((11 * 256) + 244) / 4 = 765 RPM
      final res = parser.parsePidResponse('41 0C 0B F4', '010C');
      expect(res.isSuccess, true);
      final map = res.getOrNull!;
      expect(map['pid'], '0C');
      expect(map['value'], 765.0);
      expect(map['unit'], 'RPM');
    });

    test('parsePidResponse should accurately calculate Speed (010D)', () {
      // 41 0D 32 -> 50 km/h
      final res = parser.parsePidResponse('41 0D 32', '010D');
      expect(res.isSuccess, true);
      final map = res.getOrNull!;
      expect(map['pid'], '0D');
      expect(map['value'], 50.0);
      expect(map['unit'], 'km/h');
    });

    test('parsePidResponse should accurately calculate Coolant Temp (0105)', () {
      // 41 05 7B -> 123 - 40 = 83 °C
      final res = parser.parsePidResponse('41 05 7B', '0105');
      expect(res.isSuccess, true);
      final map = res.getOrNull!;
      expect(map['pid'], '05');
      expect(map['value'], 83.0);
      expect(map['unit'], '°C');
    });

    test('parseDtcResponse should parse hex fault bytes into DTC strings', () {
      // 43 02 01 04 03 00 -> P0104, P0300
      final res = parser.parseDtcResponse('43 02 01 04 03 00');
      expect(res.isSuccess, true);
      final dtcs = res.getOrNull!;
      expect(dtcs, contains('P0104'));
      expect(dtcs, contains('P0300'));
    });

    test('parseVinResponse should extract valid ASCII VIN string', () {
      // Hex representation of "1G1JC5444R7252367"
      const hexVin = '49 02 01 31 47 31 4A 43 35 34 34 34 52 37 32 35 32 33 36 37';
      final res = parser.parseVinResponse(hexVin);
      expect(res.isSuccess, true);
      expect(res.getOrNull, '1G1JC5444R7252367');
    });

    test('parseRawResponse should parse command responses correctly', () {
      final cmd = ObdCommand(
        command: '010C',
        type: 'PID',
        priority: 1,
        timeout: 2000,
        createdAt: DateTime.now(),
      );

      final res = parser.parseRawResponse('41 0C 0B F4', cmd);
      expect(res.isSuccess, true);
      final response = res.getOrNull!;
      expect(response.isValid, true);
      expect(response.parsedData?['value'], 765.0);
    });
  });
}
