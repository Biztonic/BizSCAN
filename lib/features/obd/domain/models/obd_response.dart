import 'package:freezed_annotation/freezed_annotation.dart';

part 'obd_response.freezed.dart';
part 'obd_response.g.dart';

@freezed
class ObdResponse with _$ObdResponse {
  const factory ObdResponse({
    required String rawData,
    Map<String, dynamic>? parsedData,
    required int responseTime, // in milliseconds
    required bool isValid,
    String? error,
  }) = _ObdResponse;

  factory ObdResponse.fromJson(Map<String, dynamic> json) => _$ObdResponseFromJson(json);
}
