// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastEvents _$PastEventsFromJson(Map<String, dynamic> json) {
  return PastEvents(
    id: json['_id'] as String?,
    cakes: (json['cakes'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Cakes.fromJson(e as Map<String, dynamic>))
        .toList(),
    decorations: (json['decorations'] as List<dynamic>?)
        ?.map((e) => PastEventsDecorations.fromJson(e as Map<String, dynamic>))
        .toList(),
    drinks: (json['drinks'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventType: json['eventType'] as String?,
    theme: json['theme'] == null
        ? null
        : ThemeModel.fromJson(json['theme'] as Map<String, dynamic>),
    venue: json['venue'] == null
        ? null
        : PastEventVenue.fromJson(json['venue'] as Map<String, dynamic>),
    active: json['active'] as bool?,
    completed: json['completed'] as bool?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    numberOfPeople: json['numberOfPeople'] as int?,
    userId: json['userId'] == null
        ? null
        : User.fromJson(json['userId'] as Map<String, dynamic>),
    payment: json['payment'] == null
        ? null
        : TransactionDetails.fromJson(json['payment'] as Map<String, dynamic>),
    assignedStaff: json['assignedStaff'] == null
        ? null
        : StaffDetails.fromJson(json['assignedStaff'] as Map<String, dynamic>),
    customCake: json['customCake'] == null
        ? null
        : CustomCake.fromJson(json['customCake'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PastEventsToJson(PastEvents instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'payment': instance.payment,
      'customCake': instance.customCake,
      'eventType': instance.eventType,
      'date': instance.date?.toIso8601String(),
      'numberOfPeople': instance.numberOfPeople,
      'userId': instance.userId,
      'venue': instance.venue,
      'theme': instance.theme,
      'active': instance.active,
      'completed': instance.completed,
      'drinks': instance.drinks,
      'cakes': instance.cakes,
      'decorations': instance.decorations,
      'assignedStaff': instance.assignedStaff,
    };
