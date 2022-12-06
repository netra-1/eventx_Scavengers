// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_cake_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadCakeModelResponse _$LoadCakeModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadCakeModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : CakeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadCakeModelResponseToJson(
        LoadCakeModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
