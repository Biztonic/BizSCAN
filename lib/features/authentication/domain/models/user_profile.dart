import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userId,
    required String displayName,
    required String email,
    String? phone,
    String? photoUrl,
    required String language,
    required String themeMode,
    required String preferredUnit,
    required bool isGuest,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
