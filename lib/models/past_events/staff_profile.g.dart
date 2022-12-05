// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffProfile _$StaffProfileFromJson(Map<String, dynamic> json) {
  return StaffProfile(
    fullName: json['fullName'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    citizenship: json['citizenship'] as String?,
    gender: json['gender'] as String?,
    pan: json['pan'] as int?,
  );
}

Map<String, dynamic> _$StaffProfileToJson(StaffProfile instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'gender': instance.gender,
      'phone': instance.phone,
      'citizenship': instance.citizenship,
      'pan': instance.pan,
      'address': instance.address,
    };
