// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capacity _$CapacityFromJson(Map<String, dynamic> json) {
  return Capacity(
    id: json['_id'] as String?,
    max: json['max'] as int?,
    min: json['min'] as int?,
  );
}

Map<String, dynamic> _$CapacityToJson(Capacity instance) => <String, dynamic>{
      '_id': instance.id,
      'max': instance.max,
      'min': instance.min,
    };
