import 'package:freezed_annotation/freezed_annotation.dart';

part 'obd_command.freezed.dart';
part 'obd_command.g.dart';

@freezed
class ObdCommand with _$ObdCommand {
  const factory ObdCommand({
    required String command,
    required String type, // e.g. "AT", "PID", "DTC"
    @Default(2) int priority, // 1 = high, 2 = normal, 3 = low
    @Default(3000) int timeout, // timeout in ms
    @Default(3) int retryCount,
    required DateTime createdAt,
  }) = _ObdCommand;

  factory ObdCommand.fromJson(Map<String, dynamic> json) => _$ObdCommandFromJson(json);
}
