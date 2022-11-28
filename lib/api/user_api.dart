
import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/user/user.dart';
import 'package:eventx/models/user/user_account.dart';
import 'package:eventx/response/user/login_response.dart';
import 'package:eventx/response/user/profile_response.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

class UserAPI {
  //Register API
  

  //Login API
  Future<bool> loginUser(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      debugPrint("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      debugPrint(response.data.toString());
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        debugPrint(loginResponse.data!.user.toString());
        token = loginResponse.data!.token;
        id = loginResponse.data!.user!.id;
        debugPrint("Token: $token");
        if (token != null) {
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  
}
