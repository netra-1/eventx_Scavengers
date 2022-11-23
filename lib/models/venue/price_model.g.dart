// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return PriceModel(
    id: json['_id'] as String?,
    amount: json['amount'] as int?,
    paxRange: json['paxRange'] == null
        ? null
        : RangeModel.fromJson(json['paxRange'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'paxRange': instance.paxRange,
      'amount': instance.amount,
      '_id': instance.id,
    };
