// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffData _$StaffDataFromJson(Map<String, dynamic> json) {
  return StaffData(
    chatUserList: (json['chatUserList'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : StaffModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$StaffDataToJson(StaffData instance) => <String, dynamic>{
      '_id': instance.id,
      'chatUserList': instance.chatUserList,
    };
