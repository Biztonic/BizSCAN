import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_layout.freezed.dart';
part 'dashboard_layout.g.dart';

@freezed
class DashboardLayout with _$DashboardLayout {
  const factory DashboardLayout({
    required String id,
    required String name,
    @Default([]) List<String> visibleWidgetIds,
    @Default(2) int gridColumns,
    @Default(33) int refreshRateMs, // 30 FPS default
    @Default(false) bool isDefault,
    required DateTime createdAt,
  }) = _DashboardLayout;

  factory DashboardLayout.fromJson(Map<String, dynamic> json) =>
      _$DashboardLayoutFromJson(json);
}
