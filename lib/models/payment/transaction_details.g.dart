// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetails _$TransactionDetailsFromJson(Map<String, dynamic> json) {
  return TransactionDetails(
    token: json['token'] as String?,
    idx: json['idx'] as String?,
  );
}

Map<String, dynamic> _$TransactionDetailsToJson(TransactionDetails instance) =>
    <String, dynamic>{
      'token': instance.token,
      'idx': instance.idx,
    };
