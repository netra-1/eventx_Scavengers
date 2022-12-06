import 'package:eventx/models/decoration/decoration_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_decoration_model_response.g.dart';

@JsonSerializable()
class LoadDecorationModelResponse{
  List<DecorationModel?> data;
  String? message;
  bool? success;

  LoadDecorationModelResponse({required this.data, this.message, this.success});

  factory LoadDecorationModelResponse.fromJson(Map<String, dynamic>json) => _$LoadDecorationModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadDecorationModelResponseToJson(this);
}