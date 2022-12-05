import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'past_events_decorations.g.dart';

@JsonSerializable()
class PastEventsDecorations {
  VenueImage? image;
  int? price;
  String? name;

  PastEventsDecorations({
    this.image,
    this.name,
    this.price,
  });

  factory PastEventsDecorations.fromJson(Map<String, dynamic> json) => _$PastEventsDecorationsFromJson(json);

  Map<String, dynamic> toJson() => _$PastEventsDecorationsToJson(this);
}
