// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    message: json['message'] as String?,
    senderSelf: json['senderSelf'] as bool?,
    createdAt: json['createdAt'] as String?,
  );
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'senderSelf': instance.senderSelf,
      'createdAt': instance.createdAt,
    };
