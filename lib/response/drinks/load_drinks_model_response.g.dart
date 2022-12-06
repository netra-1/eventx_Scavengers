// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_drinks_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadDrinksModelResponse _$LoadDrinksModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadDrinksModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : DrinksModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadDrinksModelResponseToJson(
        LoadDrinksModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
