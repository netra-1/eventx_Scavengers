// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksModel _$DrinksModelFromJson(Map<String, dynamic> json) {
  return DrinksModel(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    alcoholic: json['alcoholic'] as bool?,
    available: json['available'] as bool?,
    category: json['category'] as String?,
    price: json['price'] as int?,
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DrinksModelToJson(DrinksModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'alcoholic': instance.alcoholic,
      'category': instance.category,
      'available': instance.available,
      'image': instance.image,
    };
