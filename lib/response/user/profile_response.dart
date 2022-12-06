
import 'package:eventx/models/user/user_account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  UserAccount? data;
  String? message;
  bool? success;

  ProfileResponse({
    this.data,
    this.message,
    this.success,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
