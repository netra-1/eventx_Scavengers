// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_cake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomCake _$CustomCakeFromJson(Map<String, dynamic> json) {
  return CustomCake(
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
    pound: json['pound'] as int?,
  );
}

Map<String, dynamic> _$CustomCakeToJson(CustomCake instance) =>
    <String, dynamic>{
      'image': instance.image,
      'pound': instance.pound,
    };
