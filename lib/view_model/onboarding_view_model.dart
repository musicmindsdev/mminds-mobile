import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:music_minds/model/local/dummy_data.dart';
import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view_model/profile/profile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth_view_model.dart';

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {


  late SharedPreferences sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();


  checkUser(BuildContext context) {
    initData().then((onValue) async {
      sharedPreferences = await SharedPreferences.getInstance();
      DummyData.isDarkTheme = sharedPreferences.getBool("isDarkTheme") ?? false;
      DummyData.firstTimeOnApp = sharedPreferences.getBool("firstTimeOnApp");
      logger.t("First time on App? : ${DummyData.firstTimeOnApp}");
      logger.t("Is Dark Theme : ${DummyData.isDarkTheme}");

      // if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null || DummyData.accessToken == null) {
      if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null) {
        navigateGoRouterReplace(context, AppRouteNames.onboardingScreen);
      } else {
        logger.i("Check User");
        DummyData.emailAddress = sharedPreferences.getString("Email");
        DummyData.password = sharedPreferences.getString("Password");
        DummyData.accessToken =  await _secureStorage.read(key: 'accessToken');

        logger.i(DummyData.emailAddress);
        logger.i(DummyData.accessToken);

        if (DummyData.accessToken != null && DummyData.accessToken!.isNotEmpty) {
          try {
            var token = Jwt.parseJwt(DummyData.accessToken.toString());
            logger.w(token);
            bool hasExpired = Jwt.isExpired(DummyData.accessToken.toString());
            logger.w(hasExpired);
            logger.wtf(hasExpired);

            if (!hasExpired) {
              await ProfileViewModel().loadData(context).then((value) async {
                if (value != null) {
                  // DummyData.username = value.data!.firstName.toString();
                  // DummyData.lastname = value.data!.lastName.toString();
                  await navigateGoRouterReplace(context, AppRouteNames.dashboardScreen);

                  // await navigateReplace(context, const DashBoardScreen());
                } else {
                  await sharedPreferences.remove('accessToken');
                  navigateGoRouterReplace(context, AppRouteNames.loginScreen);

                  navigateReplace(context, const LoginScreen());
                  notifyListeners();
                }
              });
            } else {
              await sharedPreferences.remove('accessToken');
              autoLogin(context);
              notifyListeners();

            }
          } catch (e) {
            logger.e("Invalid token: $e");
            await sharedPreferences.remove('accessToken');
            autoLogin(context);
            notifyListeners();

          }
        } else {
          await sharedPreferences.remove('accessToken');
          autoLogin(context);
          notifyListeners();

        }
      }
    });
  }


  void autoLogin(BuildContext context) {
    if (DummyData.emailAddress != null && DummyData.password != null) {
      logger.i(DummyData.emailAddress);
      logger.i(DummyData.password);
      AuthViewModel().userAutoLogin(context, email: DummyData.emailAddress.toString(), password: DummyData.password.toString());
    } else {
      // navigateReplace(context, const OnboardingScreen());
      context.go(AppRouteNames.onboardingScreen);

      logger.e("Auto-login failed: email or password is null");
    }
  }



  Future<void> initData() async {
    await Future<void>.delayed(const Duration(seconds: 3));
  }


}