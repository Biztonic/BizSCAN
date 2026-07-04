import 'package:freezed_annotation/freezed_annotation.dart';

part 'compatibility_profile.freezed.dart';
part 'compatibility_profile.g.dart';

@freezed
class CompatibilityProfile with _$CompatibilityProfile {
  const factory CompatibilityProfile({
    @Default([]) List<String> supportedPIDs,
    @Default([]) List<String> supportedProtocols,
    @Default([]) List<String> supportedDiagnosticModes,
    @Default([]) List<String> knownLimitations,
    @Default([]) List<String> manufacturerExtensions,
  }) = _CompatibilityProfile;

  factory CompatibilityProfile.fromJson(Map<String, dynamic> json) =>
      _$CompatibilityProfileFromJson(json);
}
