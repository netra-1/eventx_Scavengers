// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_event_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadEventModelResponse _$LoadEventModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadEventModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : EventModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadEventModelResponseToJson(
        LoadEventModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
