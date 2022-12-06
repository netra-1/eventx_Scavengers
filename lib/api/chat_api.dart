import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/chat/conversation_model.dart';
import 'package:eventx/response/chat/load_chat_model_response.dart';
import 'package:eventx/response/chat/load_chat_staff_response.dart';
import 'package:eventx/response/chat/staff_model.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

class ChatAPI{
  Future<bool> sendChat(String targetId, String msg) async {
    debugPrint("TargetId: $targetId and msg: $msg");
    bool isLogin = false;
    try {
      var url = baseUrl + insertChat;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: {
          "to": targetId,
          "message": msg,
        },
      );
      // debugPrint("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint(response.data.toString());
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<List<ConversationModel?>> loadConversation(String targetId) async {
    List<ConversationModel?> conversationModelList = [];
    Response response;
    var url = "$baseUrl$insertChat?to=$targetId";

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );

      if (response.statusCode == 200) {
        LoadConversationModelResponse loadConversationModelResponse =
            LoadConversationModelResponse.fromJson(response.data);

        for (var data in loadConversationModelResponse.data) {
          conversationModelList.add(
            ConversationModel(
              message: data!.message!,
              senderSelf: data.senderSelf,
              createdAt: data.createdAt,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Conversation $e');
    }

    return conversationModelList;
  }


  Future<List<StaffModel?>> loadChat() async {
    List<StaffModel?> staffModelList = [];
    Response response;
    var url = "$baseUrl$getStaffChat";

    var dio = HttpServices().getDioInstance();
    debugPrint("hhshsihsi");
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        LoadChatStaffResponse loadChatStaffResponse =
            LoadChatStaffResponse.fromJson(response.data);

        for (var data in loadChatStaffResponse.data!.chatUserList!) {
          staffModelList.add(
            StaffModel(
              id: data!.id,
              profile: data.profile,
              image: data.image,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get StaffChat $e');
    }

    return staffModelList;
  }

}