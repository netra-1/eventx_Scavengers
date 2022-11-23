// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueImage _$VenueImageFromJson(Map<String, dynamic> json) {
  return VenueImage(
    url: json['url'] as String?,
    publicId: json['public_id'] as String?,
  );
}

Map<String, dynamic> _$VenueImageToJson(VenueImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'public_id': instance.publicId,
    };
