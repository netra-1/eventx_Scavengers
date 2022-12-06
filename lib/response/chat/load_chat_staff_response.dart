import 'package:eventx/models/chat/conversation_model.dart';
import 'package:eventx/response/chat/staff_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_chat_staff_response.g.dart';

@JsonSerializable()
class LoadChatStaffResponse{
  StaffData? data;
  String? message;
  bool? success;

  LoadChatStaffResponse({required this.data, this.message, this.success});

  factory LoadChatStaffResponse.fromJson(Map<String, dynamic>json) => _$LoadChatStaffResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadChatStaffResponseToJson(this);
}