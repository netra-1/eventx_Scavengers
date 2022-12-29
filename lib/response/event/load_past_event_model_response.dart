import 'package:eventxandroid/models/past_events/past_events.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_past_event_model_response.g.dart';

@JsonSerializable()
class LoadPastEventModelResponse{
  List<PastEvents?> data;
  String? message;
  bool? success;

  LoadPastEventModelResponse({required this.data, this.message, this.success});

  factory LoadPastEventModelResponse.fromJson(Map<String, dynamic>json) => _$LoadPastEventModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadPastEventModelResponseToJson(this);
}