import 'package:eventx/models/venue/additional_service.dart';
import 'package:eventx/models/venue/booked_dates.dart';
import 'package:eventx/models/venue/capacity.dart';
import 'package:eventx/models/venue/price_model.dart';
import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'filtered_venue_model.g.dart';

@JsonSerializable()
class FilteredVenueModel {
  @JsonKey(name: "_id")
  String? id;
  List<BookedDates?> bookedDates;
  String? name;
  Capacity? capacity;
  List<int?> contact;
  bool? inContract;
  String? location;
  bool? verified;
  List<PriceModel?> price;
  List<String?>? remarks;
  int? established;
  bool? spaceIndoor;
  bool? spaceOutdoor;
  String? venueType;
  AdditionalService? additionalService;
  VenueImage? image;

  FilteredVenueModel({
    this.id,
    this.name,
    required this.bookedDates,
    this.capacity,
    required this.contact,
    this.inContract,
    this.location,
    required this.price,
    this.verified,
    this.additionalService,
    this.established,
    this.image,
    this.remarks,
    this.spaceIndoor,
    this.spaceOutdoor,
    this.venueType,
  });

  factory FilteredVenueModel.fromJson(Map<String, dynamic> json) =>
      _$FilteredVenueModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilteredVenueModelToJson(this);
}
