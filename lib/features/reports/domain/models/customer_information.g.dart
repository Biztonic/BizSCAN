// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerInformationImpl _$$CustomerInformationImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerInformationImpl(
  customerName: json['customerName'] as String,
  phone: json['phone'] as String? ?? '',
  email: json['email'] as String? ?? '',
  address: json['address'] as String? ?? '',
);

Map<String, dynamic> _$$CustomerInformationImplToJson(
  _$CustomerInformationImpl instance,
) => <String, dynamic>{
  'customerName': instance.customerName,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
};
