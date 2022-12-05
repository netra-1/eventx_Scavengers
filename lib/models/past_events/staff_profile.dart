import 'package:eventx/models/user/address.dart';
import 'package:json_annotation/json_annotation.dart';
part 'staff_profile.g.dart';

@JsonSerializable()
class StaffProfile {
  String? fullName;
  String? gender;
  String? phone;
  String? citizenship;
  int? pan;
  Address? address;

  StaffProfile({this.fullName, this.phone, this.address, this.citizenship, this.gender, this.pan});

  factory StaffProfile.fromJson(Map<String, dynamic> json) =>
      _$StaffProfileFromJson(json);

  Map<String, dynamic> toJson() => _$StaffProfileToJson(this);
}
