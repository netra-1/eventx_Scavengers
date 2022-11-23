import 'package:json_annotation/json_annotation.dart';
part 'booked_dates.g.dart';

@JsonSerializable()
class BookedDates {
  @JsonKey(name: "_id")
  String? id;
  String? date;
  String? eventId;

  BookedDates({
    this.id,
    this.date,
    this.eventId,
  });

  factory BookedDates.fromJson(Map<String, dynamic> json) =>
      _$BookedDatesFromJson(json);

  Map<String, dynamic> toJson() => _$BookedDatesToJson(this);
}
