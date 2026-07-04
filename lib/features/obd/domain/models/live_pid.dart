import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_pid.freezed.dart';
part 'live_pid.g.dart';

@freezed
class LivePid with _$LivePid {
  const factory LivePid({
    required String pid,
    required String name,
    required double value,
    required String unit,
    required DateTime timestamp,
    required bool isSupported,
  }) = _LivePid;

  factory LivePid.fromJson(Map<String, dynamic> json) => _$LivePidFromJson(json);
}
