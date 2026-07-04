import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_reminder.freezed.dart';
part 'service_reminder.g.dart';

@freezed
class ServiceReminder with _$ServiceReminder {
  const factory ServiceReminder({
    required String reminderId,
    required String title,
    required DateTime dueDate,
    required int dueKm,
    @Default('routine') String urgency, // 'overdue', 'immediate', 'soon', 'routine'
    @Default(false) bool completed,
    required DateTime createdAt,
  }) = _ServiceReminder;

  factory ServiceReminder.fromJson(Map<String, dynamic> json) =>
      _$ServiceReminderFromJson(json);
}
