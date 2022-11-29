import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/cake/cake_model.dart';
import 'package:eventx/models/decoration/decoration_model.dart';
import 'package:eventx/models/drinks/drinks_model.dart';
import 'package:eventx/models/theme/theme_model.dart';
import 'package:eventx/models/venue/filtered_venue_model.dart';
import 'package:eventx/response/cake/load_cake_model_response.dart';
import 'package:eventx/response/decoration/load_decoration_model_response.dart';
import 'package:eventx/response/drinks/load_drinks_model_response.dart';
import 'package:eventx/response/theme/load_theme_model_response.dart';
import 'package:eventx/response/venue/load_filtered_venue_response.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

class EventAPI {
  // Future<List<EventModel?>> loadEventType() async {
  //   List<EventModel?> eventModelList = [];
  //   Response response;
  //   var url = baseUrl + getAllEvent;

  //   var dio = HttpServices().getDioInstance();

  //   try {
  //     response = await dio.get(
  //       url,
  //       options: Options(
  //         headers: {HttpHeaders.authorizationHeader: "$token"},
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       LoadEventModelResponse loadEventModelResponse =
  //           LoadEventModelResponse.fromJson(response.data);

  //       for (var data in loadEventModelResponse.data) {
  //         eventModelList.add(
  //           EventModel(
  //             id: data!.id,
  //             name: data.name,
  //             description: data.description,
  //           ),
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint('Failed to get category $e');
  //   }

  //   return eventModelList;
  // }

  Future<List<FilteredVenueModel?>> loadFilteredVenueType(
      int noOfPeople, String date, String? indoor, String? outdoor) async {
    List<FilteredVenueModel?> venueModelList = [];
    bool? INDOOR;
    bool? OUTDOOR;
    if (indoor == "INDOOR") {
      INDOOR = true;
    } else {
      INDOOR = false;
    }
    if (outdoor == "OUTDOOR") {
      OUTDOOR = true;
    } else {
      OUTDOOR = false;
    }
    Response response;
    var url =
        "$baseUrl${getFilteredVenue}expectedPeople=$noOfPeople&&eventDate=$date&&spaceIndoor=$INDOOR&&spaceOutdoor=$OUTDOOR";
    debugPrint("URL$url");
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        LoadFilteredVenueResponse loadFilteredVenueResponse =
            LoadFilteredVenueResponse.fromJson(response.data);

        for (var data in loadFilteredVenueResponse.data) {
          venueModelList.add(
            FilteredVenueModel(
              id: data!.id,
              bookedDates: data.bookedDates,
              name: data.name,
              capacity: data.capacity,
              contact: data.contact,
              inContract: data.inContract,
              location: data.location,
              verified: data.verified,
              price: data.price,
              remarks: data.remarks,
              established: data.established,
              spaceIndoor: data.spaceIndoor,
              spaceOutdoor: data.spaceOutdoor,
              venueType: data.venueType,
              additionalService: data.additionalService,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get filtered venue $e');
    }

    return venueModelList;
  }

  Future<List<ThemeModel?>> loadThemeType() async {
    List<ThemeModel?> themeModelList = [];
    Response response;
    var url = baseUrl + getAllTheme;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadThemeModelResponse loadThemeModelResponse =
            LoadThemeModelResponse.fromJson(response.data);

        for (var data in loadThemeModelResponse.data) {
          themeModelList.add(
            ThemeModel(
              id: data!.id,
              name: data.name,
              description: data.description,
              speciality: data.speciality,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get theme $e');
    }

    return themeModelList;
  }

  Future<List<DrinksModel?>> loadDrinksType(String? category) async {
    List<DrinksModel?> drinksModelList = [];
    Response response;
    var url = "$baseUrl${getAllDrinks}category=$category";

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadDrinksModelResponse loadDrinksModelResponse =
            LoadDrinksModelResponse.fromJson(response.data);

        for (var data in loadDrinksModelResponse.data) {
          drinksModelList.add(
            DrinksModel(
              id: data!.id,
              name: data.name,
              description: data.description,
              alcoholic: data.alcoholic,
              available: data.available,
              category: data.category,
              price: data.price,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get drinks $e');
    }

    return drinksModelList;
  }

  Future<List<CakeModel?>> loadCakeType() async {
    List<CakeModel?> cakeModelList = [];
    Response response;
    var url = baseUrl + getAllCakes;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadCakeModelResponse loadCakeModelResponse =
            LoadCakeModelResponse.fromJson(response.data);

        for (var data in loadCakeModelResponse.data) {
          cakeModelList.add(
            CakeModel(
              id: data!.id,
              name: data.name,
              description: data.description,
              price: data.price,
              available: data.available,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get cake $e');
    }

    return cakeModelList;
  }

  Future<List<DecorationModel?>> loadDecorations() async {
    List<DecorationModel?> decorationModelList = [];
    Response response;
    var url = baseUrl + getAllDecoration;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadDecorationModelResponse loadDecorationModelResponse =
            LoadDecorationModelResponse.fromJson(response.data);

        for (var data in loadDecorationModelResponse.data) {
          decorationModelList.add(
            DecorationModel(
              id: data!.id,
              name: data.name,
              description: data.description,
              price: data.price,
              available: data.available,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get cake $e');
    }

    return decorationModelList;
  }
}
