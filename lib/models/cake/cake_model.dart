import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cake_model.g.dart';

@JsonSerializable()
class CakeModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;
  int? price;
  bool? available;
  VenueImage? image;

  CakeModel({
    this.id,
    this.name,
    this.description,
    this.available,
    this.price,
    this.image,
  });

  factory CakeModel.fromJson(Map<String, dynamic> json) =>
      _$CakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CakeModelToJson(this);
}
