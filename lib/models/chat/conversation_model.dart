import 'package:json_annotation/json_annotation.dart';
part 'conversation_model.g.dart';

@JsonSerializable()
class ConversationModel {
  String? message;
  bool? senderSelf;
  String? createdAt;

  ConversationModel({
    this.message,
    this.senderSelf,
    this.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
