import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/venue/venue_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'staff_model.g.dart';

@JsonSerializable()
class StaffModel {
  @JsonKey(name: "_id")
  String? id;
  Profile? profile;
  VenueImage? image;

  StaffModel({
    this.id,
    this.profile,
    this.image,
  });

  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);

  Map<String, dynamic> toJson() => _$StaffModelToJson(this);
}
