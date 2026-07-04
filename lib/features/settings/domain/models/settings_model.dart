import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required String language,
    required String theme,
    required String distanceUnit,
    required String temperatureUnit,
    required String fuelUnit,
    required bool notifications,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);
}
