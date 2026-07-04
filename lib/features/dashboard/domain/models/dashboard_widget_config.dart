import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_widget_config.freezed.dart';
part 'dashboard_widget_config.g.dart';

@freezed
class DashboardWidgetConfig with _$DashboardWidgetConfig {
  const factory DashboardWidgetConfig({
    required String widgetId,
    required String type, // 'gauge', 'chart', 'card', 'ring'
    required String pidSource, // 'RPM', 'SPEED', 'COOLANT_TEMP', 'VOLTAGE', 'FUEL_TRIM'
    @Default('dark') String themeMode,
    @Default('blue') String colorScheme,
    @Default('medium') String size, // 'small', 'medium', 'large'
    @Default(33) int refreshIntervalMs,
  }) = _DashboardWidgetConfig;

  factory DashboardWidgetConfig.fromJson(Map<String, dynamic> json) =>
      _$DashboardWidgetConfigFromJson(json);
}
