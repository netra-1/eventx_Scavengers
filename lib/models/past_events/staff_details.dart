import 'package:eventx/models/past_events/staff_profile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'staff_details.g.dart';

@JsonSerializable()
class StaffDetails {
  StaffProfile? profile;
  String? email;

  StaffDetails({
    this.email,
    this.profile,
  });

  factory StaffDetails.fromJson(Map<String, dynamic> json) => _$StaffDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StaffDetailsToJson(this);
}
