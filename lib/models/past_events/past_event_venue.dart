import 'package:json_annotation/json_annotation.dart';
part 'past_event_venue.g.dart';

@JsonSerializable()
class PastEventVenue {
  String? name;
  String? location;

  PastEventVenue({
    this.location,
    this.name,
  });

  factory PastEventVenue.fromJson(Map<String, dynamic> json) => _$PastEventVenueFromJson(json);

  Map<String, dynamic> toJson() => _$PastEventVenueToJson(this);
}
