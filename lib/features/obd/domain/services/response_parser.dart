import '../../../../core/errors/result.dart';
import '../models/obd_command.dart';
import '../models/obd_response.dart';

abstract class ResponseParser {
  Result<String> decodeHex(String rawData);
  Result<Map<String, dynamic>> parsePidResponse(String rawData, String pid);
  Result<List<String>> parseDtcResponse(String rawData);
  Result<String> parseVinResponse(String rawData);
  Result<List<String>> parseMultiFrameResponse(List<String> frames);
  Result<ObdResponse> parseRawResponse(String rawData, ObdCommand command);
}
