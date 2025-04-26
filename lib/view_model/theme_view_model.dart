import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_minds/model/local/dummy_data.dart';

import '../config/app_colors.dart';

final themeViewModel = ChangeNotifierProvider((ref) => ThemeConfig());

class ThemeConfig extends ChangeNotifier {
  // ThemeConfig._();
  //
  // static final _instance = ThemeConfig._();
  // static ThemeConfig get instance => _instance;

  // ThemeMode _themeMode = ThemeMode.dark;


  late SharedPreferences sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();


  ThemeMode _themeMode = ThemeMode.light;

  // init() async {
  //
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   DummyData.isDarkTheme= sharedPreferences.getBool("isDarkTheme") ?? false;
  //   _themeMode = DummyData.isDarkTheme==true?ThemeMode.dark:ThemeMode.light;
  //   DummyData.accessToken =  await _secureStorage.read(key: 'accessToken');
  //   setThemeMode(_themeMode);
  //   notifyListeners();
  // }


  init() async {

    sharedPreferences = await SharedPreferences.getInstance();
    bool? savedThemePreference = sharedPreferences.getBool('isDarkTheme');
    _themeMode = DummyData.isDarkTheme==true?ThemeMode.dark:ThemeMode.light;

    if (savedThemePreference == null) {
      _themeMode = ThemeMode.system;
    } else {
      _themeMode = savedThemePreference ? ThemeMode.dark : ThemeMode.light;
    }
    DummyData.isDarkTheme = _themeMode == ThemeMode.dark ||
        (_themeMode == ThemeMode.system && _isSystemDarkMode());
    DummyData.accessToken =  await _secureStorage.read(key: 'accessToken');
    setThemeMode(_themeMode);
    notifyListeners();
  }


  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    setStatusBar();
    notifyListeners();
  }

  void setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarBrightness: _themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      statusBarColor: AppColors.kPrimary1,
      // systemNavigationBarColor: AppColors.kPrimary1
    ));
  }
  bool _isSystemDarkMode() {
    return window.platformBrightness == Brightness.dark;
  }
  ThemeMode get themeMode => _themeMode;
}
