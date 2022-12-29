

import 'package:eventxandroid/api/event_api.dart';
import 'package:eventxandroid/models/cake/cake_model.dart';
import 'package:eventxandroid/models/decoration/decoration_model.dart';
import 'package:eventxandroid/models/drinks/drinks_model.dart';
import 'package:eventxandroid/models/theme/theme_model.dart';
import 'package:eventxandroid/models/venue/filtered_venue_model.dart';

class EventRepository {
  // Future<List<EventModel?>> loadEventType() {
  //   return EventAPI().loadEventType();
  // }

  Future<List<FilteredVenueModel?>> loadFilteredVenueType(
      int noOfPeople, String date, String? indoor, String? outdoor) {
    return EventAPI().loadFilteredVenueType(noOfPeople, date, indoor, outdoor);
  }

  Future<List<ThemeModel?>> loadThemeType() {
    return EventAPI().loadThemeType();
  }

  Future<List<CakeModel?>> loadCakeType() {
    return EventAPI().loadCakeType();
  }

  Future<List<DecorationModel?>> loadDecorations() {
    return EventAPI().loadDecorations();
  }

  Future<List<DrinksModel?>> loadDrinksType(String? category) {
    return EventAPI().loadDrinksType(category);
  }
}
