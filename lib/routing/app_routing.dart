import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart' ;
import 'package:go_router/go_router.dart';
import 'package:music_minds/view/screens/auth/create_account_screen.dart';
import 'package:music_minds/view/screens/auth/login_screen.dart';
import 'package:music_minds/view/screens/auth/reset_password_screens/reset_password_screen.dart';
import 'package:music_minds/view/screens/auth/reset_password_screens/set_new_password_screen.dart';
import 'package:music_minds/view/screens/auth/verify_email_screen.dart';
import 'package:music_minds/view/screens/dashboard/dashboard_screen.dart';
import 'package:music_minds/view/screens/onboarding/onboarding.dart';
import 'package:music_minds/view/screens/onboarding/splash_screen.dart';

final GlobalKey<NavigatorState> appNavKey = GlobalKey<NavigatorState>();

class AppRouting {
  static final GoRouter router = GoRouter(
    navigatorKey: appNavKey,
    initialLocation: AppRouteNames.splashScreen,
    observers: [BotToastNavigatorObserver()],
    routes: [
      /// ----------- Onboarding Screens ----------------///
      GoRoute(
        path: AppRouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouteNames.onboardingScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              key: state.pageKey,
              child:  OnboardingTestScreen(),
              transitionsBuilder: (context, animation, secAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                  child: child,
                );
              });
        },
      ),


      /// ----------- Authentication Screens ----------------///
      GoRoute(
        path: AppRouteNames.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: AppRouteNames.registrationScreen,
        builder: (context, state) => const CreateAccountScreen(),
      ),

      GoRoute(
        path: AppRouteNames.verifyEmailOtpScreen,
        builder: (context, state) => const VerifyEmailScreen(),
      ),
      GoRoute(
        path: AppRouteNames.resetPasswordScreen,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: AppRouteNames.setNewPasswordScreen,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),

      /// ----------- Dashboard Screens ----------------///
      GoRoute(
        path: AppRouteNames.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),

      /// -----------Setup Accounts Screens ----------------///


      // GoRoute(
      //   path: AppRouteNames.verifyEmailOtpScreen,
      //   builder: (context, state) {
      //     final extra = state.extra as Map<dynamic, dynamic>?;
      //     final email = extra?['email'] ?? 'Email';
      //     final title = extra?['title'] ?? 'title';
      //     final password = extra?['password'] ?? 'password';
      //     final subTitle = extra?['subTitle'] ?? 'subTitle';
      //     return OtpVerificationScreen(
      //       title: title,
      //       email: email,
      //       pwd: password,
      //       subTitle: subTitle,
      //     );
      //   },
      // ),

    ],
  );
}

class AppRouteNames {
  /// ----------- Onboarding Screens ----------------///
  static const String splashScreen = '/splash-screen';
  static const String onboardingScreen = "/onboarding-screen";

  /// ----------- Authentication Screens ----------------///
  static const String loginScreen = '/login-screen';
  static const String registrationScreen = '/registration-screen';
  static const String resetPasswordScreen = '/reset-password-screen';
  static const String setNewPasswordScreen = '/set-new-password-screen';
  static const String verifyEmailOtpScreen = '/verify-email-otp-screen';

  /// ----------- Dashboard Screens ----------------///
  static const String dashboardScreen = '/dashboard-screen';

  /// -----------Setup Accounts Screens ----------------///
  static const String userProfileScreen = '/user-profile-screen';
  static const String userGenderScreen = '/user-gender-screen';
  static const String userGenresScreen = '/user-genres-screen';
  static const String profilePictureScreen = '/profile-picture-screen';
  static const String accountSetUpCompleteScreen = '/account-setup-complete-screen';

}

navigateGoRouterReplace(BuildContext context, String routeName) {
  context.go(routeName);
}

void navigateGoRouterPush(BuildContext context, String routeName) {
  context.push(routeName);
}

void navigateGoRouterBack(BuildContext context) {
  context.pop();
}
