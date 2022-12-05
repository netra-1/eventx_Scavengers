// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) {
  return AnnouncementModel(
    id: json['_id'] as String?,
    message: json['message'] as String?,
    read: json['read'] as bool?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'title': instance.title,
      'read': instance.read,
    };
