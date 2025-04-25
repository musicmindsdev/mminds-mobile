import 'dart:io';

import 'package:music_minds/config/app_configs.dart';
import 'package:music_minds/model/local/dummy_data.dart';
// https://musicalminds-be.onrender.com
class ApiConstants {
  // final persist = Persist();
  final String scheme = 'https';
  final String host = apiUrlHost!;
  final int receiveTimeout = 3000;
  final int sendTimeout = 2000;
  final String version = 'v1';
  final api = 'api';
  final authPath = 'auth';
  final userPath = 'users';

  ///<------------------------------- Authentication begins here ----------------------------------->
  Uri get signUpUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/register'); //Signup url

  Uri get loginUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/login'); // login url


  Uri get sendOTPUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/resend-otp'); // Resends otp to email

  Uri get verifyEmailUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/verify-email'); // Verify account using otp

  Uri get forgotPasswordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/request-reset'); // Request Forgot Password Otp

  Uri get verifyResetPasswordOtpUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/verify-reset'); // Verify Forgot Password Otp

  Uri get resetPasswordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$authPath/reset-password'); // Reset Password

  ///<------------------------------- Authentication ends here ----------------------------------->
  ///
  ///
  ///
  ///<------------------------------- User Profile begins here ----------------------------------->
  Uri get getProfileUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/me'); //Fetch user profile

  Uri get updateUserProfileUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/update'); // Update user profile

  Uri get deleteUserProfileUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/profile'); //Delete user account

  Uri checkUsernameAvailabilityUri({required String username}) => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/username/check/$username');

  Uri get kycVerificationUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/kyc-verification');

  Uri get changePasswordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/profile/change-password');

  Uri get submitKYCUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/submit-kyc'); //Submit Kyc

  Uri get updateUserProfileImageUri => Uri(
      scheme: scheme,
      host: host,
      path: '$api/$version/$userPath/image-update'); //Image upload uri
  ///<------------------------------- User Profile ends here ----------------------------------->


  Map<String, String> apiHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: '*/*',
  };

  Map<String, String> apiHeaderWithToken() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.authorizationHeader: 'Bearer ${DummyData.accessToken}',
      'X-Authorization': '${DummyData.accessToken}'
    };
  }

  // Map<String, String> apiHeaderWithToken(String token) {
  //   return {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  // }
}
