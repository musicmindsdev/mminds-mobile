import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(Locale('en'));

  void setLocale(Locale locale) {
    state = locale;

  }

  void _saveLocaleToPreferences(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }

  Future<void> loadLocaleFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedLocale = prefs.getString('locale');
    if (savedLocale != null) {
      state = Locale(savedLocale);
      _saveLocaleToPreferences(Locale(savedLocale));
    }
  }
}


final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) {
  final provider = LocaleProvider();
  provider.loadLocaleFromPreferences(); // Load from SharedPreferences on startup
  return provider;
});

// final localeProvider = StateNotifierProvider<LocaleProvider, Locale>((ref) {
//   return LocaleProvider();
// });

