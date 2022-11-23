import 'package:json_annotation/json_annotation.dart';
part 'venue_image.g.dart';

@JsonSerializable()
class VenueImage {
  String? url;
  @JsonKey(name: "public_id")
  String? publicId;

  VenueImage({
    this.url,
    this.publicId,
  });

  factory VenueImage.fromJson(Map<String, dynamic> json) =>
      _$VenueImageFromJson(json);

  Map<String, dynamic> toJson() => _$VenueImageToJson(this);
}
