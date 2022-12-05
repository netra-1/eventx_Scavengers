// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    id: json['_id'] as String?,
    accountStatus: json['accountStatus'] as String?,
    isVerified: json['isVerified'] as bool?,
    email: json['email'] as String?,
    category: json['category'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'profile': instance.profile,
      'accountStatus': instance.accountStatus,
      'isVerified': instance.isVerified,
      'email': instance.email,
      'category': instance.category,
      'password': instance.password,
    };
