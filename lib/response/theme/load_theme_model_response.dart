import 'package:eventx/models/theme/theme_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_theme_model_response.g.dart';

@JsonSerializable()
class LoadThemeModelResponse{
  List<ThemeModel?> data;
  String? message;
  bool? success;

  LoadThemeModelResponse({required this.data, this.message, this.success});

  factory LoadThemeModelResponse.fromJson(Map<String, dynamic>json) => _$LoadThemeModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadThemeModelResponseToJson(this);
}