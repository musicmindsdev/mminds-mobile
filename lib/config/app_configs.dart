import 'package:flutter/foundation.dart';

/// This code is defining a nullable String variable named `apiUrlHost`. It is using the
/// `bool.hasEnvironment` method to check if the environment variable `URL_HOST` is defined.

String? apiUrlHost = kDebugMode ? "music-minds-backend.onrender.com" : "music-minds-backend.onrender.com";