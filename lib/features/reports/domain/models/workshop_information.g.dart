// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkshopInformationImpl _$$WorkshopInformationImplFromJson(
  Map<String, dynamic> json,
) => _$WorkshopInformationImpl(
  workshopName: json['workshopName'] as String,
  logo: json['logo'] as String? ?? '',
  address: json['address'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  email: json['email'] as String? ?? '',
  website: json['website'] as String? ?? '',
  gstNumber: json['gstNumber'] as String? ?? '',
  technicianName: json['technicianName'] as String? ?? '',
);

Map<String, dynamic> _$$WorkshopInformationImplToJson(
  _$WorkshopInformationImpl instance,
) => <String, dynamic>{
  'workshopName': instance.workshopName,
  'logo': instance.logo,
  'address': instance.address,
  'phone': instance.phone,
  'email': instance.email,
  'website': instance.website,
  'gstNumber': instance.gstNumber,
  'technicianName': instance.technicianName,
};
