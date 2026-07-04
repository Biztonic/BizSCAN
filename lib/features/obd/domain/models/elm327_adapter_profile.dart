import 'package:freezed_annotation/freezed_annotation.dart';

part 'elm327_adapter_profile.freezed.dart';
part 'elm327_adapter_profile.g.dart';

@freezed
class Elm327AdapterProfile with _$Elm327AdapterProfile {
  const factory Elm327AdapterProfile({
    required String adapterName,
    required String firmwareVersion,
    @Default('12.0V') String voltage,
    required String protocol,
    @Default([]) List<String> capabilities,
    @Default(false) bool isClone,
    @Default(0) int cloneScore, // 0 to 100
    @Default([]) List<String> supportedCommands,
    @Default(20) int responseDelayMs,
    @Default(512) int maxBuffer,
    @Default(1.0) double successRate,
    @Default(30) int avgLatencyMs,
    @Default(1500) int initTimeMs,
    required DateTime lastSeen,
  }) = _Elm327AdapterProfile;

  factory Elm327AdapterProfile.fromJson(Map<String, dynamic> json) =>
      _$Elm327AdapterProfileFromJson(json);
}
