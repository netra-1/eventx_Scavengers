import 'package:eventx/response/chat/staff_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'staff_data.g.dart';

@JsonSerializable()
class StaffData{
  @JsonKey(name: "_id")
  String? id;
  List<StaffModel?>? chatUserList;

  StaffData({this.chatUserList, this.id});

  factory StaffData.fromJson(Map<String, dynamic>json) => _$StaffDataFromJson(json);

  Map<String, dynamic> toJson() => _$StaffDataToJson(this);
}