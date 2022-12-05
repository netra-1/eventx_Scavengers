import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'decoration_model.g.dart';

@JsonSerializable()
class DecorationModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;
  int? price;
  bool? available;
  VenueImage? image;

  DecorationModel({
    this.id,
    this.name,
    this.description,
    this.available,
    this.price,
    this.image,
  });

  factory DecorationModel.fromJson(Map<String, dynamic> json) =>
      _$DecorationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DecorationModelToJson(this);
}
