// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookedDates _$BookedDatesFromJson(Map<String, dynamic> json) {
  return BookedDates(
    id: json['_id'] as String?,
    date: json['date'] as String?,
    eventId: json['eventId'] as String?,
  );
}

Map<String, dynamic> _$BookedDatesToJson(BookedDates instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'eventId': instance.eventId,
    };
