import 'package:json_annotation/json_annotation.dart';
part 'capacity.g.dart';

@JsonSerializable()
class Capacity {
  @JsonKey(name: "_id")
  String? id;
  int? max;
  int? min;

  Capacity({this.id, this.max, this.min});

  factory Capacity.fromJson(Map<String, dynamic> json) =>
      _$CapacityFromJson(json);

  Map<String, dynamic> toJson() => _$CapacityToJson(this);
}
