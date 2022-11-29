// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return PaymentDetails(
    amount: json['amount'] as String?,
    cakes: (json['cakes'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Cakes.fromJson(e as Map<String, dynamic>))
        .toList(),
    decorations: (json['decorations'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    drinks: (json['drinks'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventType: json['eventType'] as String?,
    date: json['date'] as String?,
    numberOfPeople: json['numberOfPeople'] as int?,
    theme: json['theme'] as String?,
    venue: json['venue'] as String?,
    userId: json['userId'] as String?,
    payment: json['payment'] == null
        ? null
        : TransactionDetails.fromJson(json['payment'] as Map<String, dynamic>),
    customCakeImage: json['customCakeImage'] as String?,
    customCakePound: json['customCakePound'] as int?,
  );
}

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'amount': instance.amount,
      'eventType': instance.eventType,
      'date': instance.date,
      'numberOfPeople': instance.numberOfPeople,
      'userId': instance.userId,
      'venue': instance.venue,
      'theme': instance.theme,
      'drinks': instance.drinks,
      'cakes': instance.cakes,
      'decorations': instance.decorations,
      'customCakeImage': instance.customCakeImage,
      'customCakePound': instance.customCakePound,
    };
