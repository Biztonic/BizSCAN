// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      language: json['language'] as String,
      themeMode: json['themeMode'] as String,
      preferredUnit: json['preferredUnit'] as String,
      isGuest: json['isGuest'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'email': instance.email,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'language': instance.language,
      'themeMode': instance.themeMode,
      'preferredUnit': instance.preferredUnit,
      'isGuest': instance.isGuest,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
