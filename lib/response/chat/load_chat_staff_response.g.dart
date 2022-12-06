// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_chat_staff_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadChatStaffResponse _$LoadChatStaffResponseFromJson(
    Map<String, dynamic> json) {
  return LoadChatStaffResponse(
    data: json['data'] == null
        ? null
        : StaffData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadChatStaffResponseToJson(
        LoadChatStaffResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
