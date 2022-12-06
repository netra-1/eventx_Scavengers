// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_theme_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadThemeModelResponse _$LoadThemeModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadThemeModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : ThemeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadThemeModelResponseToJson(
        LoadThemeModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
