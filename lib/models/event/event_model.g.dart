// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return EventModel(
    image: json['image'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
