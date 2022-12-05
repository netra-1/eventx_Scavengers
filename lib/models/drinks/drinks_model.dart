import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drinks_model.g.dart';

@JsonSerializable()
class DrinksModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;
  int? price;
  bool? alcoholic;
  String? category;
  bool? available;
  VenueImage? image;

  DrinksModel({
    this.id,
    this.name,
    this.description,
    this.alcoholic,
    this.available,
    this.category,
    this.price,
    this.image,
  });

  factory DrinksModel.fromJson(Map<String, dynamic> json) =>
      _$DrinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksModelToJson(this);
}
