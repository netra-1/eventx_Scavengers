// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_filtered_venue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadFilteredVenueResponse _$LoadFilteredVenueResponseFromJson(
    Map<String, dynamic> json) {
  return LoadFilteredVenueResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : FilteredVenueModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$LoadFilteredVenueResponseToJson(
        LoadFilteredVenueResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };
