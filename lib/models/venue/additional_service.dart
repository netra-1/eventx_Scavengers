import 'package:json_annotation/json_annotation.dart';
part 'additional_service.g.dart';

@JsonSerializable()
class AdditionalService {
  int? dj;
  int? spaceOnly;

  AdditionalService({
    this.dj,
    this.spaceOnly,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) =>
      _$AdditionalServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalServiceToJson(this);
}
