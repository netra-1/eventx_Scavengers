// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CakeModel _$CakeModelFromJson(Map<String, dynamic> json) {
  return CakeModel(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    available: json['available'] as bool?,
    price: json['price'] as int?,
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CakeModelToJson(CakeModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'available': instance.available,
      'image': instance.image,
    };
