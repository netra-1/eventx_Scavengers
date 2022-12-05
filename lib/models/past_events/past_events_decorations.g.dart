// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_events_decorations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastEventsDecorations _$PastEventsDecorationsFromJson(
    Map<String, dynamic> json) {
  return PastEventsDecorations(
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
    name: json['name'] as String?,
    price: json['price'] as int?,
  );
}

Map<String, dynamic> _$PastEventsDecorationsToJson(
        PastEventsDecorations instance) =>
    <String, dynamic>{
      'image': instance.image,
      'price': instance.price,
      'name': instance.name,
    };
