import 'package:eventx/models/past_events/custom_cake.dart';
import 'package:eventx/models/past_events/past_event_venue.dart';
import 'package:eventx/models/past_events/past_events_decorations.dart';
import 'package:eventx/models/past_events/staff_details.dart';
import 'package:eventx/models/payment/cake_details.dart';
import 'package:eventx/models/payment/items_details.dart';
import 'package:eventx/models/payment/transaction_details.dart';
import 'package:eventx/models/theme/theme_model.dart';
import 'package:eventx/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'past_events.g.dart';

@JsonSerializable()
class PastEvents {
  @JsonKey(name:"_id")
  String? id;
  TransactionDetails? payment;
  CustomCake? customCake;
  // String? amount;
  String? eventType;
  DateTime? date;
  int? numberOfPeople;
  User? userId;
  PastEventVenue? venue;
  ThemeModel? theme;
  bool? active;
  bool? completed;
  List<Items?>? drinks;
  List<Cakes?>? cakes;
  List<PastEventsDecorations>? decorations;
  StaffDetails? assignedStaff;

  PastEvents({
    this.id,
    this.cakes,
    this.decorations,
    this.drinks,
    this.eventType,
    this.theme,
    this.venue,
    this.active,
    this.completed,
    this.date,
    this.numberOfPeople,
    this.userId,
    this.payment,
    this.assignedStaff,
    this.customCake,
  });
  
  factory PastEvents.fromJson(Map<String, dynamic> json) => _$PastEventsFromJson(json);

  Map<String, dynamic> toJson() => _$PastEventsToJson(this);
}
