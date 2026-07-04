import 'package:freezed_annotation/freezed_annotation.dart';

part 'obd_session.freezed.dart';
part 'obd_session.g.dart';

@freezed
class ObdSession with _$ObdSession {
  const factory ObdSession({
    required String sessionId,
    required String transportType, // e.g. "bluetooth", "wifi", "usb", "emulator"
    required String deviceName,
    required String protocol,
    required DateTime connectedAt,
    DateTime? disconnectedAt,
    String? firmwareVersion,
    String? adapterVersion,
    required int latency, // in milliseconds
    required String connectionQuality, // e.g. "excellent", "good", "poor"
  }) = _ObdSession;

  factory ObdSession.fromJson(Map<String, dynamic> json) => _$ObdSessionFromJson(json);
}
