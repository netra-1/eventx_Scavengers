// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffDetails _$StaffDetailsFromJson(Map<String, dynamic> json) {
  return StaffDetails(
    email: json['email'] as String?,
    profile: json['profile'] == null
        ? null
        : StaffProfile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StaffDetailsToJson(StaffDetails instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'email': instance.email,
    };
