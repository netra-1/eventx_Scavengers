import 'package:json_annotation/json_annotation.dart';
part 'cake_details.g.dart';

@JsonSerializable()
class Cakes {
  @JsonKey(name: "_id")
  String? id;
  int? pound;

  Cakes({
    this.id,
    this.pound,
  });

  factory Cakes.fromJson(Map<String, dynamic> json) => _$CakesFromJson(json);

  Map<String, dynamic> toJson() => _$CakesToJson(this);
}
