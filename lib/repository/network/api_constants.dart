import 'dart:io';
// https://musicalminds-be.onrender.com
class ApiConstants {
  // final persist = Persist();
  final String scheme = 'https';
  final String host = "music-minds.onrender.com";
  final int receiveTimeout = 3000;
  final int sendTimeout = 2000;
  final String apiVersion = '/v1';

  final authPath = 'auth/users';
  // final employerOrgPath = 'employer/organization';

  Uri get loginUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/login');

  Uri get signUpUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/signup');
  Uri get confirmAccountUri =>
      Uri(scheme: scheme, host: host, path: '$apiVersion/$authPath/confirm');
  //
  // Uri  getEmployersUri ({ required String page, required String searchString}) => Uri(
  //   scheme: scheme,
  //   host: host,
  //   path: '$apiVersion/ew-admin/organization',
  //   queryParameters: {'limit': '20', 'page': page, 'search': searchString},
  // );
  //


  // static final token = Provider((ref) => ref.watch(regViewModelProvider).token);
//*! can be modified
  Map<String, String> apiHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };


  Map<String, String> apiHeaderWithToken(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
