import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';

class Elm327ResponseCleaner {
  /// Cleans raw text output from ELM327 adapters
  String clean(String raw) {
    var text = raw.trim();

    // Strip prompt character >
    text = text.replaceAll('>', '');

    // Strip carriage returns and linefeeds
    text = text.replaceAll('\r', '').replaceAll('\n', '');

    // Remove noise keywords
    text = text.replaceAll('SEARCHING...', '');

    // Remove duplicate whitespace
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();

    return text;
  }

  /// Extracts hex data bytes only
  String extractHex(String raw) {
    final cleaned = clean(raw);
    final hexOnly = cleaned.replaceAll(RegExp(r'[^0-9A-Fa-f]'), '');
    return hexOnly.toUpperCase();
  }

  /// Detects ELM327 hardware error strings
  Result<String> validateResponse(String raw) {
    final text = clean(raw).toUpperCase();

    if (text.contains('UNABLE TO CONNECT')) {
      return const Result.failure(Elm327BusFailure('Unable to connect to vehicle ECU bus'));
    }
    if (text.contains('BUS ERROR')) {
      return const Result.failure(Elm327BusFailure('CAN/KWP vehicle bus communication error'));
    }
    if (text.contains('CAN ERROR')) {
      return const Result.failure(Elm327BusFailure('CAN bus hardware error'));
    }
    if (text.contains('DATA ERROR')) {
      return const Result.failure(ParserFailure('Corrupted data frame received'));
    }
    if (text.contains('BUFFER FULL')) {
      return const Result.failure(Elm327FreezeFailure('Adapter buffer full overflow'));
    }
    if (text.contains('STOPPED')) {
      return const Result.failure(Elm327FreezeFailure('Adapter execution stopped'));
    }
    if (text == '?' || text.contains('?')) {
      return const Result.failure(UnsupportedCommandFailure('Command not recognized by ELM327 adapter'));
    }
    if (text.contains('NO DATA')) {
      return const Result.success('NO DATA');
    }

    return Result.success(text);
  }
}
