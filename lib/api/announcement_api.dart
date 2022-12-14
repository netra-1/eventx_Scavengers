import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/models/announcement/announcement_model.dart';
import 'package:eventx/response/announcement/load_announcement_response.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

import 'http_services.dart';

class AnnouncementAPI {
  Future<List<AnnouncementModel?>> loadAnnouncement() async {
    List<AnnouncementModel?> listAnnouncementModel = [];
    Response response;
    var url = baseUrl + getAllAnnouncement;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadAnnouncementResponse loadAnnouncementResponse =
            LoadAnnouncementResponse.fromJson(response.data);

        for (var data in loadAnnouncementResponse.data!) {
          listAnnouncementModel.add(
            AnnouncementModel(
              id: data!.id,
              message: data.message,
              read: data.read,
              title: data.title,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get theme $e');
    }

    return listAnnouncementModel;
  }

  Future<bool> readAnnouncement(String announcementId) async{
    bool isRead = false;
    Response response;
    var url = baseUrl + getAllAnnouncement + announcementId;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.put(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint('Failed to get theme $e');
    }
    return isRead;
  }
}
