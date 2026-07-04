import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_session.freezed.dart';
part 'scan_session.g.dart';

@freezed
class ScanSession with _$ScanSession {
  const factory ScanSession({
    required String scanId,
    required String vehicleId,
    required String userId,
    required DateTime startedAt,
    DateTime? completedAt,
    required String connectionType,
    String? bluetoothDevice,
    required String protocol,
    required int scanDuration, // in seconds
    String? firmwareVersion,
    required String appVersion,
    required bool isSynced,
  }) = _ScanSession;

  factory ScanSession.fromJson(Map<String, dynamic> json) => _$ScanSessionFromJson(json);
}
