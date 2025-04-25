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
        "role": "user",
        "username": userName,
      },
    );
  }

  Future<dynamic> confirmUserAccount({
    required String email,
    required String otp,
  }) async {
    return postMth(
      confirmAccountUri,
      headers: apiHeader,
      body: {'email': email, 'otp': otp},
    );
  }
}
