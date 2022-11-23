// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) {
  return ThemeModel(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    speciality:
        (json['speciality'] as List<dynamic>).map((e) => e as String?).toList(),
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThemeModelToJson(ThemeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'speciality': instance.speciality,
      'image': instance.image,
    };
