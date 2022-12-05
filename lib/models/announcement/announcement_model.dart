import 'package:json_annotation/json_annotation.dart';
part 'announcement_model.g.dart';

@JsonSerializable()
class AnnouncementModel {
  @JsonKey(name: "_id")
  String? id;
  String? message;
  String? title;
  bool? read;

  AnnouncementModel({
    this.id,
    this.message,
    this.read,
    this.title,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);
}
