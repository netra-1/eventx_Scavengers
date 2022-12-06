import 'package:eventx/models/venue/filtered_venue_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'load_filtered_venue_response.g.dart';

@JsonSerializable()
class LoadFilteredVenueResponse {
  List<FilteredVenueModel?> data;
  String? message;
  bool? success;

  LoadFilteredVenueResponse({required this.data, this.message, this.success});

  factory LoadFilteredVenueResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadFilteredVenueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadFilteredVenueResponseToJson(this);
}
