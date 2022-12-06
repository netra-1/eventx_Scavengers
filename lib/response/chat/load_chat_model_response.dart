import 'package:eventx/models/chat/conversation_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_chat_model_response.g.dart';

@JsonSerializable()
class LoadConversationModelResponse{
  List<ConversationModel?> data;
  String? message;
  bool? success;

  LoadConversationModelResponse({required this.data, this.message, this.success});

  factory LoadConversationModelResponse.fromJson(Map<String, dynamic>json) => _$LoadConversationModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadConversationModelResponseToJson(this);
}