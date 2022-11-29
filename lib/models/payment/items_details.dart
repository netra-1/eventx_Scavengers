import 'package:json_annotation/json_annotation.dart';
part 'items_details.g.dart';

@JsonSerializable()
class Items {
  @JsonKey(name :"_id")
  String? id;
  int? quantity;

  Items({
    this.id,
    this.quantity,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
