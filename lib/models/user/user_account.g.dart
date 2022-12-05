// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return UserAccount(
    id: json['_id'] as String?,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    accountStatus: json['accountStatus'] as String?,
    category: json['category'] as String?,
    email: json['email'] as String?,
    isVerified: json['isVerified'] as bool?,
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'profile': instance.profile,
      'accountStatus': instance.accountStatus,
      'category': instance.category,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'image': instance.image,
    };
