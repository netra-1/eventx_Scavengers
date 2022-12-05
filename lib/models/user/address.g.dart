// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    province: json['province'] as String?,
    city: json['city'] as String?,
    ward: json['ward'] as int?,
    tole: json['tole'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'province': instance.province,
      'city': instance.city,
      'ward': instance.ward,
      'tole': instance.tole,
    };
