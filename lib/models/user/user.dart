import 'package:eventx/models/user/profile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  Profile? profile;
  String? accountStatus;
  bool? isVerified;
  String? email;
  String? category;
  String? password;

  User({
    this.profile,
    this.id,
    this.accountStatus,
    this.isVerified,
    this.email,
    this.category,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
