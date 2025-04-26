// ignore_for_file: use_build_context_synchronously

import 'package:music_minds/repository/services/api/api_service.dart';

class AuthBackend extends ApiService {
  Future<dynamic> signInUser({
    required String email,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'email': email, 'password': password},
    );
  }

  Future<dynamic> signUp({
    required String fullName,
    required String userName,
    required String email,
    required String password,
    // required String role,
  }) async {
    return postMth(
      signUpUri,
      headers: apiHeader,
      body: {
        "fullName": fullName,
        "username": userName,
        "email": email,
        "password": password,
      },
    );
  }
  Future<dynamic> verifyEmail({
    required String email,
    required String otp,
  }) async {
    return postMth(
      verifyEmailUri,
      headers: apiHeader,
      body: {
        'email': email,
        "otp": otp.trim(),
      },
    );
  }



  Future<dynamic> sendAndResendOTP({
    required String email,
    String? phone,
    required String channel,
  }) async {
    return postMth(
      sendOTPUri,
      headers: apiHeader,
      body: {
        'email': email.trim(),
      },
    );
  }

  Future<dynamic> forgotPassword({
    required String email,
    String? phone,
  }) async {
    return postMth(
      forgotPasswordUri,
      headers: apiHeader,
      body: {
        'email': email.trim(),
      },
    );
  }

  Future<dynamic> verifyResetPasswordOtp({
    required String email,
    String? phone,
  }) async {
    return postMth(
      verifyResetPasswordOtpUri,
      headers: apiHeader,
      body: {
        'email': email.trim(),
      },
    );
  }


  Future<dynamic> resetPassword({
    required String sid,
    required String password,
  }) async {
    return postMth(
      resetPasswordUri,
      headers: apiHeader,
      body: {
        'sid': sid.trim(),
        "password": password
      },
    );
  }


  Future<dynamic> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return postMth(
      changePasswordUri,
      headers: apiHeaderWithToken(),
      body: {
        "current_password": newPassword,
        "new_password": oldPassword,
      },
    );
  }
}
