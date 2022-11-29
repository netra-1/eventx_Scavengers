import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/user/user.dart';
import 'package:eventx/models/user/user_account.dart';
import 'package:eventx/response/user/login_response.dart';
import 'package:eventx/response/user/profile_response.dart';
import 'package:eventx/utils/url.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';

class UserAPI {
  //Register API
  Future<bool> registerUser(User user) async {
    debugPrint(user.profile!.fullName);
    debugPrint(user.email!);
    debugPrint(user.password!);
    debugPrint(user.category!);

    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    // debugPrint(user.toJson().toString());
    try {
      response = await dio.post(
        url,
        data: {
          "email": user.email!,
          "password": user.password!,
          "category": user.category!,
          "profile": {
            "fullName": user.profile!.fullName,
          },
        },
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
    return isSignup;
  }

  Future<bool> updateProfile(Profile profile) async {
    // debugPrint(user.profile!.fullName);
    bool isUpdated = false;
    Response response;
    var url = baseUrl + updateProfileUrl;
    var dio = HttpServices().getDioInstance();
    // debugPrint(user.toJson().toString());
    FormData formData = profile.image != null
        ? FormData.fromMap({
            "fullName": profile.fullName,
            "image": await MultipartFile.fromFile(
              profile.image!,
              filename: profile.image!.split("/").last,
              contentType: MediaType(
                "image",
                "jpeg",
              ),
            ),
            "phone": profile.phone,
            // "address": {
            //   "province": profile.address!.province,
            //   "city": profile.address!.city,
            //   "ward": profile.address!.ward,
            //   "tole": profile.address!.tole,
            // }
          })
        : FormData.fromMap({
            "fullName": profile.fullName,
            "phone": profile.phone,
            // "address": {
            //   "province": profile.address!.province,
            //   "city": profile.address!.city,
            //   "ward": profile.address!.ward,
            //   "tole": profile.address!.tole,
            // }
          });
    try {
      response = await dio.put(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: formData,
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 202) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return isUpdated;
  }

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

  Future<UserAccount?> viewProfile() async {
    UserAccount? userAccount;
    try {
      var url = baseUrl + viewUserProfile;
      var dio = HttpServices().getDioInstance();

      Response response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      debugPrint("dddddddddddddddddddddddd");

      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        debugPrint("RRRRRRRRRRRRRRRRRRRRRRRRRRRR");
        ProfileResponse profileResponse =
            ProfileResponse.fromJson(response.data);
        userAccount = UserAccount(
          id: profileResponse.data!.id,
          profile: profileResponse.data!.profile,
          accountStatus: profileResponse.data!.accountStatus,
          category: profileResponse.data!.category,
          email: profileResponse.data!.email,
          isVerified: profileResponse.data!.isVerified,
          image: profileResponse.data!.image,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("EEEEEEEEEEEEEEEEEEEEEEEEEEEE${userAccount!.isVerified}");
    return userAccount;
  }

  Future<bool> verifyOTP(String otpCode, String operation, String email) async {
    bool isverified = false;
    try {
      var url = baseUrl + verifyotp;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "otpCode": otpCode,
          "operation": operation,
          "email": email,
        },
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }

  Future<bool> resendOTP(String operation, String email) async {
    bool isverified = false;
    try {
      var url = baseUrl + resendotp;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "operation": operation,
          "email": email,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }

  Future<List<dynamic>> forgotPassword(String email) async {
    bool isverified = false;
    String msg = "Failed";
    try {
      var url = baseUrl + forgotPasswordUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "email": email,
        },
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return [true, "OTP has been sent to your email"];
      } else if (response.statusCode == 404) {
        return [false, "User not found"];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [isverified, msg];
  }

  Future<List<dynamic>> resetPassword(String email, String password) async {
    bool isverified = false;
    String msg = "Password Failed";
    debugPrint("Email: $password");
    try {
      var url = baseUrl + resetPasswordUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return [true, "You have successfully set a new password"];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [isverified, msg];
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    bool isverified = false;
    // debugPrint("Email: $password");
    try {
      var url = baseUrl + changePasswordUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.put(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: {
          "prevPassword": oldPassword,
          "newPassword": newPassword,
        },
      );
      // response.data
      print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      debugPrint("lllll${response.data}");
      if (response.statusCode == 202) {
        return true;
      } else if (response.statusCode == 401) {
        debugPrint(
            "Error OLD PASSWORDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      }
    } catch (e) {
      debugPrint("Error: Change: $e");
      return isverified;
    }
    return isverified;
  }
}
