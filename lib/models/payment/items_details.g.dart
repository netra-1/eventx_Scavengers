// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    id: json['_id'] as String?,
    quantity: json['quantity'] as int?,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      '_id': instance.id,
      'quantity': instance.quantity,
    };
