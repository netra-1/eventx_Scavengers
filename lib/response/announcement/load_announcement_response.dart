import 'package:eventx/models/announcement/announcement_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_announcement_response.g.dart';

@JsonSerializable()
class LoadAnnouncementResponse{
  List<AnnouncementModel?>? data;
  String? message;
  bool? success;

  LoadAnnouncementResponse({required this.data, this.message, this.success});

  factory LoadAnnouncementResponse.fromJson(Map<String, dynamic>json) => _$LoadAnnouncementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadAnnouncementResponseToJson(this);
}