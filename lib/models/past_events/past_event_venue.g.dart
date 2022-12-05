// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_event_venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastEventVenue _$PastEventVenueFromJson(Map<String, dynamic> json) {
  return PastEventVenue(
    location: json['location'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$PastEventVenueToJson(PastEventVenue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
    };
