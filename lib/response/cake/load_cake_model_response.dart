import 'package:eventx/models/cake/cake_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_cake_model_response.g.dart';

@JsonSerializable()
class LoadCakeModelResponse{
  List<CakeModel?> data;
  String? message;
  bool? success;

  LoadCakeModelResponse({required this.data, this.message, this.success});

  factory LoadCakeModelResponse.fromJson(Map<String, dynamic>json) => _$LoadCakeModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadCakeModelResponseToJson(this);
}