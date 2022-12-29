import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventxandroid/api/http_services.dart';
import 'package:eventxandroid/models/past_events/past_events.dart';
import 'package:eventxandroid/models/payment/payment_details.dart';
import 'package:eventxandroid/response/event/load_past_event_model_response.dart';
import 'package:eventxandroid/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class PaymentAPI {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    bool isverified = false;

    try {
      var url = baseUrl + postTransactionUrl;
      var dio = HttpServices().getDioInstance();
      debugPrint("TRY1..............................");
      FormData? formData;
      if (paymentDetails.customCakeImage != null) {
        debugPrint(
            "Filname: ${paymentDetails.customCakeImage!.split("/").last}");
        debugPrint("cake...................");
        formData = FormData.fromMap({
          "payment": {
            "token": paymentDetails.payment!.token,
            "idx": paymentDetails.payment!.idx,
          },
          "eventType": paymentDetails.eventType,
          "date": paymentDetails.date,
          "numberOfPeople": paymentDetails.numberOfPeople,
          "venue": paymentDetails.venue,
          "theme": paymentDetails.theme,
          "drinks": paymentDetails.drinks!.map((obj) => obj!.toJson()).toList(),
          "decorations": paymentDetails.decorations!,
          "cakes": paymentDetails.cakes!.map((obj) => obj!.toJson()).toList(),
          "customCakeImage": await MultipartFile.fromFile(
            paymentDetails.customCakeImage!,
            filename: paymentDetails.customCakeImage!.split("/").last,
            contentType: MediaType(
              "image",
              "jpeg",
            ),
          ),
          // "customCakeImage":File(paymentDetails.customCakeImage!) ,
          "customCakePound": paymentDetails.customCakePound,
        });
      }

      Response response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: paymentDetails.customCakeImage != null
            ? formData!
            : {
                "payment": {
                  "token": paymentDetails.payment!.token,
                  "idx": paymentDetails.payment!.idx,
                },
                "eventType": paymentDetails.eventType,
                "date": paymentDetails.date,
                "numberOfPeople": paymentDetails.numberOfPeople,
                "venue": paymentDetails.venue,
                "theme": paymentDetails.theme,
                "drinks": paymentDetails.drinks,
                "decorations": paymentDetails.decorations,
                "cakes": paymentDetails.cakes,
              },
      );
      debugPrint("Payment API response: : : ${response.data}");

      debugPrint(
          "okkkkkkkkkkkkkkkkkkkkkkkkkkkkk:ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }

  Future<List<PastEvents?>> loadPastEvents() async {
    List<PastEvents?> pastEventsList = [];
    Response response;
    var url = "$baseUrl${postTransactionUrl}mine";

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      debugPrint("Response Events: ${response.data}");
      if (response.statusCode == 200) {
        LoadPastEventModelResponse loadThemeModelResponse =
            LoadPastEventModelResponse.fromJson(response.data);

        for (var data in loadThemeModelResponse.data) {
          pastEventsList.add(
            PastEvents(
              customCake: data!.customCake,
              id: data.id,
              cakes: data.cakes,
              decorations: data.decorations,
              drinks: data.drinks,
              theme: data.theme,
              venue: data.venue,
              payment: data.payment,
              eventType: data.eventType,
              date: data.date,
              numberOfPeople: data.numberOfPeople,
              userId: data.userId,
              active: data.active,
              completed: data.completed,
              assignedStaff: data.assignedStaff,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return pastEventsList;
  }
}
