// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteredVenueModel _$FilteredVenueModelFromJson(Map<String, dynamic> json) {
  return FilteredVenueModel(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    bookedDates: (json['bookedDates'] as List<dynamic>)
        .map((e) =>
            e == null ? null : BookedDates.fromJson(e as Map<String, dynamic>))
        .toList(),
    capacity: json['capacity'] == null
        ? null
        : Capacity.fromJson(json['capacity'] as Map<String, dynamic>),
    contact: (json['contact'] as List<dynamic>).map((e) => e as int?).toList(),
    inContract: json['inContract'] as bool?,
    location: json['location'] as String?,
    price: (json['price'] as List<dynamic>)
        .map((e) =>
            e == null ? null : PriceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    verified: json['verified'] as bool?,
    additionalService: json['additionalService'] == null
        ? null
        : AdditionalService.fromJson(
            json['additionalService'] as Map<String, dynamic>),
    established: json['established'] as int?,
    image: json['image'] == null
        ? null
        : VenueImage.fromJson(json['image'] as Map<String, dynamic>),
    remarks:
        (json['remarks'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    spaceIndoor: json['spaceIndoor'] as bool?,
    spaceOutdoor: json['spaceOutdoor'] as bool?,
    venueType: json['venueType'] as String?,
  );
}

Map<String, dynamic> _$FilteredVenueModelToJson(FilteredVenueModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bookedDates': instance.bookedDates,
      'name': instance.name,
      'capacity': instance.capacity,
      'contact': instance.contact,
      'inContract': instance.inContract,
      'location': instance.location,
      'verified': instance.verified,
      'price': instance.price,
      'remarks': instance.remarks,
      'established': instance.established,
      'spaceIndoor': instance.spaceIndoor,
      'spaceOutdoor': instance.spaceOutdoor,
      'venueType': instance.venueType,
      'additionalService': instance.additionalService,
      'image': instance.image,
    };
