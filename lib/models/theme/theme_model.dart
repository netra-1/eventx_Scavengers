import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'theme_model.g.dart';

@JsonSerializable()
class ThemeModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;
  List<String?> speciality;
  VenueImage? image;


  ThemeModel({
    this.id,
    this.name,
    this.description,
    required this.speciality,
    this.image,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
