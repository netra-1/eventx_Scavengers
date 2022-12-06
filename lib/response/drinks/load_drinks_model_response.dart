import 'package:eventx/models/drinks/drinks_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_drinks_model_response.g.dart';

@JsonSerializable()
class LoadDrinksModelResponse{
  List<DrinksModel?> data;
  String? message;
  bool? success;

  LoadDrinksModelResponse({required this.data, this.message, this.success});

  factory LoadDrinksModelResponse.fromJson(Map<String, dynamic>json) => _$LoadDrinksModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadDrinksModelResponseToJson(this);
}