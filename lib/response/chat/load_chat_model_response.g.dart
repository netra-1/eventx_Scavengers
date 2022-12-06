// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_chat_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadConversationModelResponse _$LoadConversationModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadConversationModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : ConversationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadConversationModelResponseToJson(
        LoadConversationModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
