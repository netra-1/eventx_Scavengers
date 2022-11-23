import 'package:json_annotation/json_annotation.dart';
part 'range_model.g.dart';

@JsonSerializable()
class RangeModel {
  int? from;
  int? to;

  RangeModel({this.from, this.to});

  factory RangeModel.fromJson(Map<String, dynamic> json) =>
      _$RangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RangeModelToJson(this);
}
