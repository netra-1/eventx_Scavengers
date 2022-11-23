import 'package:eventx/models/venue/range_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  RangeModel? paxRange;
  int? amount;
  @JsonKey(name: "_id")
  String? id;

  PriceModel({this.id, this.amount, this.paxRange});

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}
