import 'package:eventx/models/event/event_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_event_model_response.g.dart';

@JsonSerializable()
class LoadEventModelResponse{
  List<EventModel?> data;
  String? message;
  bool? success;

  LoadEventModelResponse({required this.data, this.message, this.success});

  factory LoadEventModelResponse.fromJson(Map<String, dynamic>json) => _$LoadEventModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadEventModelResponseToJson(this);
}