import 'package:json_annotation/json_annotation.dart';
part 'transaction_details.g.dart';

@JsonSerializable()
class TransactionDetails {
  String? token;
  String? idx;

  TransactionDetails({
    this.token,
    this.idx,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) => _$TransactionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailsToJson(this);
}
