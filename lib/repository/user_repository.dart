import 'package:eventx/api/user_api.dart';
import 'package:eventx/models/user/profile.dart';
import 'package:eventx/models/user/user.dart';
import 'package:eventx/models/user/user_account.dart';

class UserRepository {
  Future<bool> registerUser(User customer) async {
    return UserAPI().registerUser(customer);
  }

  Future<bool> loginUser(String email, String password) {
    return UserAPI().loginUser(email, password);
  }

  Future<bool> verifyOTP(String otpCode, String operation, String email) {
    return UserAPI().verifyOTP(otpCode, operation, email);
  }

  Future<bool> resendOTP(String operation, String email) {
    return UserAPI().resendOTP(operation, email);
  }

  Future<UserAccount?> viewProfile() {
    return UserAPI().viewProfile();
  }

  Future<bool> updateProfile(Profile profile) {
    return UserAPI().updateProfile(profile);
  }

  Future<List<dynamic>> forgotPassword(String email) {
    return UserAPI().forgotPassword(email);
  }

  Future<List<dynamic>> resetPassword(String email, String password) {
    return UserAPI().resetPassword(email, password);
  }

  Future<bool> changePassword(String oldPassword, String newPassword) {
    return UserAPI().changePassword(oldPassword, newPassword);
  }
}
