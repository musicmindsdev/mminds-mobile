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
  final String apiVersion = '/v1';
  final api = 'api';
  final authPath = 'auth';
  final userPath = 'user';

  Uri get loginUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/login');

  Uri get signUpUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/signup');
  Uri get confirmAccountUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/confirm');

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
