// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_announcement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadAnnouncementResponse _$LoadAnnouncementResponseFromJson(
    Map<String, dynamic> json) {
  return LoadAnnouncementResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AnnouncementModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadAnnouncementResponseToJson(
        LoadAnnouncementResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
