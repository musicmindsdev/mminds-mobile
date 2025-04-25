import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {


  late SharedPreferences sharedPreferences;


  checkUser(context) {
    initData().then((onValue) async {

      navigateReplace(context, const OnboardingTestScreen());



      // sharedPreferences = await SharedPreferences.getInstance();
      // DummyData.firstTimeOnApp = sharedPreferences.getBool("firstTimeOnApp");
      // logger.t("First time on App? : ${DummyData.firstTimeOnApp}");
      //
      // if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null) {
      //   navigateReplace(context, const LoginScreen());
      // } else {
      //   logger.i("Check User");
      //   //  DummyData.localUserID = sharedPreferences.getString("UserID");
      //   DummyData.username = sharedPreferences.getString("username");
      //   DummyData.password = sharedPreferences.getString("Password");
      //
      //   logger.i("get Password");
      //
      //   if (DummyData.username != null && DummyData.password != null) {
      //
      //     logger.i(DummyData.username);
      //     logger.i(DummyData.password);
      //     submitLogin(context);
      //   } else{
      //     navigateReplace(context, const LoginScreen());
      //     logger.e("error");
      //   }
      // }
    });
  }
  //
  // submitLogin(context) async {
  //   logger.i("Call Login API");
  //   try {
  //
  //     await AuthBackend().signInAuto(context, id: DummyData.username.toString(),
  //       password: DummyData.password.toString(), );
  //   } catch (e) {
  //     logger.e(e);
  //     navigateReplace(context, const LoginScreen());
  //   }
  // }


  Future<void> initData() async {
    await Future<void>.delayed(const Duration(seconds: 3));
  }


}