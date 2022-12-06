// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_past_event_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadPastEventModelResponse _$LoadPastEventModelResponseFromJson(
    Map<String, dynamic> json) {
  return LoadPastEventModelResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : PastEvents.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadPastEventModelResponseToJson(
        LoadPastEventModelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
