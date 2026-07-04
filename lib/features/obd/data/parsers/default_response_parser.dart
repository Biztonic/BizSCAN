import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/models/obd_command.dart';
import '../../domain/models/obd_response.dart';
import '../../domain/services/response_parser.dart';

class DefaultResponseParser implements ResponseParser {
  @override
  Result<String> decodeHex(String rawData) {
    final clean = rawData.replaceAll(RegExp(r'[^0-9A-Fa-f]'), '');
    if (clean.length % 2 != 0) {
      return const Result.failure(ParserFailure('Invalid hex string length'));
    }
    return Result.success(clean.toUpperCase());
  }

  @override
  Result<Map<String, dynamic>> parsePidResponse(String rawData, String pid) {
    try {
      final hexResult = decodeHex(rawData);
      if (hexResult.isFailure) return Result.failure(hexResult.failureOrNull!);

      final hex = hexResult.getOrNull!;
      final cleanPid = pid.replaceAll(RegExp(r'[^0-9A-Fa-f]'), '').toUpperCase();
      String expectedMode = '41';
      if (cleanPid.length >= 2) {
        final modeInt = int.tryParse(cleanPid.substring(0, 2), radix: 16) ?? 1;
        expectedMode = (0x40 + modeInt).toRadixString(16).padLeft(2, '0').toUpperCase();
      }

      if (!hex.startsWith(expectedMode)) {
        return Result.failure(ParserFailure('Response does not match expected mode $expectedMode'));
      }

      final bytes = <int>[];
      for (var i = 0; i < hex.length; i += 2) {
        bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
      }

      final pidCode = cleanPid.substring(cleanPid.length > 2 ? cleanPid.length - 2 : 0);
      double? numericValue;
      String unit = '';
      String name = 'PID $pidCode';

      if (pidCode == '0C' && bytes.length >= 4) {
        // Engine RPM: ((A * 256) + B) / 4
        final a = bytes[2];
        final b = bytes[3];
        numericValue = ((a * 256) + b) / 4.0;
        unit = 'RPM';
        name = 'Engine Speed';
      } else if (pidCode == '0D' && bytes.length >= 3) {
        // Vehicle Speed: A
        numericValue = bytes[2].toDouble();
        unit = 'km/h';
        name = 'Vehicle Speed';
      } else if (pidCode == '05' && bytes.length >= 3) {
        // Coolant Temp: A - 40
        numericValue = (bytes[2] - 40).toDouble();
        unit = '°C';
        name = 'Engine Coolant Temperature';
      } else {
        numericValue = bytes.length > 2 ? bytes[2].toDouble() : 0.0;
        unit = 'raw';
      }

      return Result.success({
        'pid': pidCode,
        'name': name,
        'value': numericValue,
        'unit': unit,
        'bytes': bytes,
      });
    } catch (e) {
      return Result.failure(ParserFailure('PID parse error: $e'));
    }
  }

  @override
  Result<List<String>> parseDtcResponse(String rawData) {
    try {
      final hexResult = decodeHex(rawData);
      if (hexResult.isFailure) return Result.failure(hexResult.failureOrNull!);

      final hex = hexResult.getOrNull!;
      if (!hex.startsWith('43') && !hex.startsWith('47')) {
        return const Result.failure(ParserFailure('Invalid DTC response header'));
      }

      final dtcs = <String>[];
      final bytes = <int>[];
      for (var i = 2; i < hex.length; i += 2) {
        bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
      }

      // DTC bytes pairs
      for (var i = 1; i < bytes.length - 1; i += 2) {
        final b1 = bytes[i];
        final b2 = bytes[i + 1];

        if (b1 == 0 && b2 == 0) continue;

        final typeBits = (b1 & 0xC0) >> 6;
        String prefix;
        switch (typeBits) {
          case 0: prefix = 'P'; break;
          case 1: prefix = 'C'; break;
          case 2: prefix = 'B'; break;
          case 3: prefix = 'U'; break;
          default: prefix = 'P';
        }

        final d1 = (b1 & 0x30) >> 4;
        final d2 = b1 & 0x0F;
        final d3 = (b2 & 0xF0) >> 4;
        final d4 = b2 & 0x0F;

        dtcs.add('$prefix${d1.toRadixString(16)}${d2.toRadixString(16)}${d3.toRadixString(16)}${d4.toRadixString(16)}'.toUpperCase());
      }

      return Result.success(dtcs);
    } catch (e) {
      return Result.failure(ParserFailure('DTC parse error: $e'));
    }
  }

  @override
  Result<String> parseVinResponse(String rawData) {
    try {
      final hexResult = decodeHex(rawData);
      if (hexResult.isFailure) return Result.failure(hexResult.failureOrNull!);

      final hex = hexResult.getOrNull!;
      final sb = StringBuffer();
      for (var i = 0; i < hex.length; i += 2) {
        final charCode = int.parse(hex.substring(i, i + 2), radix: 16);
        if (charCode >= 32 && charCode <= 126) {
          final char = String.fromCharCode(charCode);
          if (RegExp(r'[A-HJ-NPR-Z0-9]').hasMatch(char)) {
            sb.write(char);
          }
        }
      }
      final vin = sb.toString();
      if (vin.length < 5) {
        return const Result.failure(ParserFailure('VIN parse generated insufficient length'));
      }
      return Result.success(vin);
    } catch (e) {
      return Result.failure(ParserFailure('VIN parse error: $e'));
    }
  }

  @override
  Result<List<String>> parseMultiFrameResponse(List<String> frames) {
    try {
      final combined = <String>[];
      for (final frame in frames) {
        final clean = frame.replaceAll(RegExp(r'^[0-9A-Fa-f]:\s*'), '').trim();
        combined.add(clean);
      }
      return Result.success(combined);
    } catch (e) {
      return Result.failure(ParserFailure('Multi-frame parse error: $e'));
    }
  }

  @override
  Result<ObdResponse> parseRawResponse(String rawData, ObdCommand command) {
    try {
      final clean = rawData.trim();
      final isErr = clean.contains('ERROR') || clean.contains('NO DATA') || clean.contains('STOPPED') || clean.contains('?');

      Map<String, dynamic>? parsed;
      if (!isErr && command.type == 'PID') {
        final pidParsed = parsePidResponse(clean, command.command);
        if (pidParsed.isSuccess) {
          parsed = pidParsed.getOrNull;
        }
      }

      final responseTime = DateTime.now().difference(command.createdAt).inMilliseconds;
      return Result.success(ObdResponse(
        rawData: clean,
        parsedData: parsed,
        responseTime: responseTime > 0 ? responseTime : 15,
        isValid: !isErr,
        error: isErr ? clean : null,
      ));
    } catch (e) {
      return Result.failure(ParserFailure('Raw response parse error: $e'));
    }
  }
}
