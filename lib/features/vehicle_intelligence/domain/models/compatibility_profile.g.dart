// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatibility_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompatibilityProfileImpl _$$CompatibilityProfileImplFromJson(
  Map<String, dynamic> json,
) => _$CompatibilityProfileImpl(
  supportedPIDs:
      (json['supportedPIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  supportedProtocols:
      (json['supportedProtocols'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  supportedDiagnosticModes:
      (json['supportedDiagnosticModes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  knownLimitations:
      (json['knownLimitations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  manufacturerExtensions:
      (json['manufacturerExtensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CompatibilityProfileImplToJson(
  _$CompatibilityProfileImpl instance,
) => <String, dynamic>{
  'supportedPIDs': instance.supportedPIDs,
  'supportedProtocols': instance.supportedProtocols,
  'supportedDiagnosticModes': instance.supportedDiagnosticModes,
  'knownLimitations': instance.knownLimitations,
  'manufacturerExtensions': instance.manufacturerExtensions,
};
