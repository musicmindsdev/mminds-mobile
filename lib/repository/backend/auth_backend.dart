// ignore_for_file: use_build_context_synchronously

import 'package:music_minds/repository/services/api/api_service.dart';

class AuthBackend extends ApiService {
  Future<dynamic> signInAdmin({
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
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String role,
    required String profileType,
    required String profileCategory,
    required String profileBio,
    required String gender,
    required String genres,

    // required String role,
  }) async {
    return postMth(
      signUpUri,
      headers: apiHeader,
      body:{
        "firstName": firstName,
        "lastName": lastName,
        "role": "user",
        "username": userName,
        "profileType": "Fan",
        "profileCategory": "string",
        "profileBio": "string",
        "genres": [
          "string"
        ],
        "gender": "string",
        "email": email,
        "password": password,
        "confirmPassword":password
      }
      // {
      //   'firstName': firstName,
      //   'lastName': lastName,
      //   'role': "user",
      //   'email': email,
      //   'password': password,
      //   'confirmPassword': password,
      //   "profileType": profileType,
      //   "profileCategory": profileCategory,
      //   "profileBio": profileBio,
      //   'gender': gender,
      //   'genres': ["string"],
      // },
    );
  }

  Future<dynamic> confirmUserAccount({
    required String email,
    required String otp,
  }) async {
    return postMth(
      confirmAccountUri,
      headers: apiHeader,
      body: {'email': email, 'otp':otp},
    );
  }
}
