
import 'package:eventxandroid/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'custom_cake.g.dart';

@JsonSerializable()
class CustomCake {
  VenueImage? image;
  int? pound;

  CustomCake({
    this.image,
    this.pound,
  });

  factory CustomCake.fromJson(Map<String, dynamic> json) => _$CustomCakeFromJson(json);

  Map<String, dynamic> toJson() => _$CustomCakeToJson(this);
}
