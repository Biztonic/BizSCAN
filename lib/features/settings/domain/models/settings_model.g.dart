// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      language: json['language'] as String,
      theme: json['theme'] as String,
      distanceUnit: json['distanceUnit'] as String,
      temperatureUnit: json['temperatureUnit'] as String,
      fuelUnit: json['fuelUnit'] as String,
      notifications: json['notifications'] as bool,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': instance.theme,
      'distanceUnit': instance.distanceUnit,
      'temperatureUnit': instance.temperatureUnit,
      'fuelUnit': instance.fuelUnit,
      'notifications': instance.notifications,
    };
