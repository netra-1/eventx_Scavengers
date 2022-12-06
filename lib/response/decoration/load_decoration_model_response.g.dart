// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_decoration_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadDecorationModelResponse _$LoadDecorationModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadDecorationModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : DecorationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadDecorationModelResponseToJson(
        LoadDecorationModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
