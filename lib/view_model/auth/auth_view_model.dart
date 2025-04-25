import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_minds/model/response/registration_successful_response_model.dart';
import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/models.dart';
import 'package:music_minds/src/repository.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/components/custom_alerts.dart';
import 'package:music_minds/view/screens/auth/email_verified_success_screen.dart';
import 'package:music_minds/view/screens/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final TextEditingController _loginEmailController = TextEditingController(
    text: DummyData.emailAddress ?? '',
  );
  final TextEditingController _loginPwdController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  final TextEditingController _forgotPwdEmailController =
      TextEditingController();

  ///final TextEditingController _pinCodeController = TextEditingController();

  String _pinCode = '';
  int? _role;
  final String _roleName = '';

  // int? selectedRole;
  final TextEditingController _resetPwdConfirmController =
      TextEditingController();

  final TextEditingController _resetPwdController = TextEditingController();

  bool _loginObscurePass = true;
  bool _obscureOldPass = true;
  bool _obscureNewPass = true;
  bool _obscureConfirmNewPass = true;
  bool _obscureResetPass = true;
  bool _obscureResetConfirmPass = true;
  bool isSettingUpPassword = false;
  // bool _isSwitchingRole = false;

  bool get obscureResetPass => _obscureResetPass;
  bool get obscureResetConfirmPass => _obscureResetConfirmPass;
  // bool get isSwitchingRole => _isSwitchingRole;
  int? get role => _role;
  String get roleName => _roleName;
  bool _isResendingOTP = false;

  bool get isResendingOTP => _isResendingOTP;
  final authService = AuthBackend();

  final loginFormKey = GlobalKey<FormState>();
  final changePasswordFormKey = GlobalKey<FormState>();
  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();
  final pinFormKey = GlobalKey<FormState>();

  // final loginFormKey = GlobalKey<FormState>();
  // final forgotPassFormKey = GlobalKey<FormState>();
  // final resetPassFormKey = GlobalKey<FormState>();
  // final pinFormKey = GlobalKey<FormState>();

  //

  CustomButtonState _buttonLoginState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  final CustomButtonState _buttonRoleState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  CustomButtonState _buttonVerifyState = CustomButtonState(
    buttonState: ButtonState.disabled,
    text: TTexts.continueText,
  );

  CustomButtonState _buttonCreatePasswordState = CustomButtonState(
    buttonState: ButtonState.disabled,
    text: TTexts.continueText,
  );

  CustomButtonState _buttonResetPwdState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.continueText,
  );
  final CustomButtonState _buttonChangePwdState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.continueText,
  );

  CustomButtonState _buttonForgotPWdState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  TextEditingController get loginEmailController => _loginEmailController;
  TextEditingController get loginPwdController => _loginPwdController;
  TextEditingController get oldPasswordController => _oldPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmNewPasswordController =>
      _confirmNewPasswordController;

  TextEditingController get forgotPwdEmailController =>
      _forgotPwdEmailController;

  TextEditingController get resetPwdConfirmController =>
      _resetPwdConfirmController;

  TextEditingController get resetPwdController => _resetPwdController;
  bool get loginObscurePass => _loginObscurePass;
  bool get obscureOldPass => _obscureOldPass;
  bool get obscureNewPass => _obscureNewPass;
  bool get obscureConfirmPass => _obscureConfirmNewPass;
  CustomButtonState? get buttonLoginState => _buttonLoginState;
  CustomButtonState? get buttonRoleState => _buttonRoleState;
  CustomButtonState? get buttonVerifyState => _buttonVerifyState;
  CustomButtonState? get buttonCreatePasswordState =>
      _buttonCreatePasswordState;
  CustomButtonState? get buttonForgotPWdState => _buttonForgotPWdState;
  CustomButtonState? get buttonResetPwdState => _buttonResetPwdState;
  CustomButtonState? get buttonChangePwdState => _buttonChangePwdState;

  toggleOldPassVisibility() {
    _obscureOldPass = !_obscureOldPass;
    notifyListeners();
  }

  toggleNewPassVisibility() {
    _obscureNewPass = !_obscureNewPass;
    notifyListeners();
  }

  toggleConfirmPassVisibility() {
    _obscureConfirmNewPass = !_obscureConfirmNewPass;
    notifyListeners();
  }

  toggleLoginPwdVisibility() {
    _loginObscurePass = !_loginObscurePass;
    notifyListeners();
  }

  toggleResetPwdVisibility() {
    _obscureResetPass = !_obscureResetPass;
    notifyListeners();
  }

  toggleResetConfirmPwdVisibility() {
    _obscureResetConfirmPass = !_obscureResetConfirmPass;
    notifyListeners();
  }

  void updateVerifyButtonState(String value) {
    _pinCode = value;
    notifyListeners();

    if (_pinCode.length < 4) {
      _buttonVerifyState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: TTexts.login,
      );
    } else {
      _buttonVerifyState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: TTexts.login,
      );
    }
    notifyListeners();
  }

  Future<void> userLogin(BuildContext context) async {
    try {
      _buttonLoginState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService
          .signInUser(
            email: _loginEmailController.text.toLowerCase(),
            password: _loginPwdController.text,
          )
          .then((value) async {
            if (value != null) {
              if (value['status'].toString() == 'success') {
                logger.t(value['data']['token'].toString());
                _buttonLoginState = CustomButtonState(
                  buttonState: ButtonState.idle,
                  text: TTexts.login,
                );
                if (value['data']['user']['is_email_verified'].toString() ==
                    'false') {
                  DummyData.emailAddress =
                      _loginEmailController.text.toString();
                  notifyListeners();
                  navigatePush(
                    context,
                    VerifyEmailScreen(
                      // title:TTexts.otpVerificationText,
                      // subTitle:TTexts.sixDigitOtpText,
                      email: _loginEmailController.text.toString(),
                      pwd: _loginPwdController.text.toString().trim(),
                    ),
                  );
                } else {

                  showToast(msg: 'Login successful', isError: false);
                  DummyData.emailAddress = _loginEmailController.text;
                  DummyData.password = _loginPwdController.text;
                  await saveUserEmail(_loginEmailController.text);
                  await getUserEmail();
                  await saveAccessToken(value['data']['access_token'].toString());
                  await getAccessToken();
                  await saveAppTme();
                  await saveUserPassword(_loginPwdController.text);
                  await getUserPassword();
                  navigateGoRouterReplace(context, AppRouteNames.splashScreen);
                }
              }
            }
          })
          .whenComplete(() {
            _buttonLoginState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );
            notifyListeners();
          });
    } on InternetException catch (e) {
      showToast(
        msg: 'No internet connection. Please check your network.',
        isError: true,
      );
      logger.e(e);
    } on RequestTimeoutException catch (e) {
      showToast(
        msg: 'Server took too long to respond. Please try again.',
        isError: true,
      );
      logger.e(e);
    } catch (e, s) {
      showToast(msg: TTexts.somethingWentWrong, isError: true);
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  //
  Future<void> callForgotPwd(BuildContext context) async {
    try {
      _buttonForgotPWdState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService
          .sendAndResendOTP(
            email: _forgotPwdEmailController.text.toLowerCase(),
            channel: 'email',
          )
          .then((value) async {
            if (value != null) {
              if (value['status'].toString() == 'true') {
                showToast(msg: value['message'].toString(), isError: false);
                _buttonForgotPWdState = CustomButtonState(
                  buttonState: ButtonState.idle,
                  text: TTexts.resetPass,
                );

                DummyData.emailAddress =
                    _forgotPwdEmailController.text.toString();
                notifyListeners();
                navigatePush(
                  context,
                  VerifyEmailScreen(
                    // title: TTexts.otpVerificationText,
                    // subTitle: TTexts.sixDigitOtpText,
                    isForgotPassword: true,
                    email: _forgotPwdEmailController.text.toString(),
                    pwd: '',
                  ),
                );

                // await navigateReplace(context, const DashboardScreen());
              } else if (value['status'].toString() == 'false') {
                showToast(msg: value['message'].toString(), isError: false);
                notifyListeners();
              }
            }
          })
          .whenComplete(() {
            _buttonForgotPWdState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.resetPass,
            );
            notifyListeners();
          });
    } catch (e, s) {
      showToast(msg: TTexts.somethingWentWrong, isError: true);
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  Future<bool> resendOTP(BuildContext context, {required String email}) async {
    bool resentOTP = false;
    try {
      _isResendingOTP = true;
      notifyListeners();
      await authService
          .sendAndResendOTP(email: email, channel: 'email')
          .then((value) async {
            if (value != null) {
              // final decodeResponse = jsonDecode(value.toString());

              if (value['status'].toString() == 'true') {
                showToast(msg: value['message'].toString(), isError: false);
              } else {
                showToast(msg: value['message'].toString(), isError: true);
              }
              _isResendingOTP = false;
              // resentOTP = value['status'];
              notifyListeners();
            }
          })
          .whenComplete(() {
            _isResendingOTP = false;
            notifyListeners();
          });
    } catch (e, s) {
      showToast(msg: TTexts.somethingWentWrong, isError: true);
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
    return resentOTP;
  }

  Future<void> userAutoLogin(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    logger.f(email);
    logger.f(password);
    try {
      _buttonLoginState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService
          .signInUser(email: email.toLowerCase(), password: password)
          .then((value) async {
            if (value != null) {
              if (value['status'].toString() == 'success') {
                _buttonLoginState = CustomButtonState(
                  buttonState: ButtonState.idle,
                  text: TTexts.login,
                );

                if (value['data']['is_email_verified'].toString() == 'false') {
                  DummyData.emailAddress =
                      _loginEmailController.text.toString();
                  notifyListeners();
                  navigatePush(
                    context,
                    VerifyEmailScreen(
                      // title: TTexts.otpVerificationText,
                      // subTitle: TTexts.sixDigitOtpText,
                      email: _loginEmailController.text.toString(),
                      pwd: _loginPwdController.text.toString().trim(),
                    ),
                  );
                } else {
                  showToast(msg: 'Login successful', isError: false);
                  DummyData.emailAddress = _loginEmailController.text;
                  DummyData.password = _loginPwdController.text;
                  await saveUserEmail(_loginEmailController.text);
                  await getUserEmail();
                  await saveAccessToken(value['data']['access_token'].toString());
                  await getAccessToken();
                  await saveAppTme();
                  await saveUserPassword(_loginPwdController.text);
                  await getUserPassword();
                  navigateGoRouterReplace(context, AppRouteNames.splashScreen);

                  // navigateReplace(context, DashBoardScreen());
                  // WidgetRebirth.createRebirth(context: context);
                }
              } else {
                // navigatePush(context, const LoginScreen());
                navigateGoRouterPush(context, AppRouteNames.loginScreen);
              }
            } else {
              // navigatePush(context, const LoginScreen());
              navigateGoRouterPush(context, AppRouteNames.loginScreen);
            }
          })
          .whenComplete(() {
            _buttonLoginState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );
            notifyListeners();
          });
    } catch (e, s) {
      // navigatePush(context, const LoginScreen());
      navigateGoRouterPush(context, AppRouteNames.loginScreen);
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  Future<void> verifyFPwdEmail(
    context, {
    required String email,
    required String pwd,
    bool isForgotPassword = false,
  }) async {
    if (isForgotPassword) {
      navigatePush(context, const ResetPasswordScreen());
    } else {
      try {
        _buttonVerifyState = CustomButtonState(
          buttonState: ButtonState.loading,
          text: TTexts.continueText,
        );
        notifyListeners();
        await authService
            .verifyEmail(email: email.toLowerCase(), otp: _pinCode.toString())
            .then((value) async {
              if (value != null) {
                if (value['status'].toString() == 'success') {
                  _buttonVerifyState = CustomButtonState(
                    buttonState: ButtonState.idle,
                    text: TTexts.continueText,
                  );
                  DummyData.userId = value['data']['userId'];
                  await saveUserEmail(email.toLowerCase());
                  await getUserEmail();
                  await saveAccessToken(value['data']['verificationToken']);
                  await getAccessToken();
                  // await saveAccessToken(value['data']['access_token'].toString());
                  // await getAccessToken();
                  // await saveAppTme();
                  // await saveUserPassword(pwd.toString());
                  // await getUserPassword();
                  navigateGoRouterReplace(
                    context,
                    AppRouteNames.dashboardScreen,
                  );
                  showToast(msg: value['message'], isError: false);

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   // the new route
                  //   MaterialPageRoute(
                  //       builder: (BuildContext context) =>  SuccessScreen(
                  //             infoText: emailSuccessfullyVerified,
                  //             newPage: LoginScreen(),
                  //             navigateButtonText: TTexts.continueText,
                  //           )),
                  //   (Route route) => false,
                  // );
                } else if (value['status'].toString() == 'false') {
                  showToast(msg: value['message'].toString(), isError: false);
                  notifyListeners();
                }
              }
            })
            .whenComplete(() {
              _buttonVerifyState = CustomButtonState(
                buttonState: ButtonState.idle,
                text: TTexts.continueText,
              );
              notifyListeners();
            });
      } catch (e, s) {
        showToast(msg: TTexts.somethingWentWrong, isError: true);
        logger
          ..i(TTexts.checkErrorLogs)
          ..e(s);
      }
    }
  }

  Future<void> resetPwd(context, {required String sid}) async {
    try {
      _buttonResetPwdState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.continueText,
      );
      notifyListeners();
      await authService
          .resetPassword(
            // email: _forgotPwdEmailController.text.toString().toLowerCase(),
            sid: sid,
            password: _resetPwdController.text.toString(),
            // otp: _pinCode.toString(),
          )
          .then((value) async {
            if (value != null) {
              if (value['status'].toString() == 'true') {
                _buttonResetPwdState = CustomButtonState(
                  buttonState: ButtonState.idle,
                  text: TTexts.continueText,
                );

                CustomAlerts().displaySuccessDialog(
                  context,
                  title: TTexts.passwordResetSuccessful,
                  subTitle: '',
                  btnOnePressed: () async {
                    navigateGoRouterReplace(context, AppRouteNames.loginScreen);
                  },
                );
              } else if (value['status'].toString() == 'false') {
                showToast(msg: value['message'].toString(), isError: false);
                notifyListeners();
              }
            }
          })
          .whenComplete(() {
            _buttonResetPwdState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.continueText,
            );
            notifyListeners();
          });
    } catch (e, s) {
      showToast(msg: TTexts.somethingWentWrong, isError: true);
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  saveUserEmail(localUserEmail) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", localUserEmail);
    logger.i("saved Email Address ${DummyData.emailAddress}");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password");
  }

  getUserEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.emailAddress = sharedPreferences.getString("Email");
    logger.i("get  Email Address ${DummyData.emailAddress}");
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password ${DummyData.password}");
  }

  // saveAccessToken(accessToken) async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString("accessToken", accessToken);
  //   logger.i("saved accessToken");
  // }

  saveAccessToken(accessToken) async {
    await _secureStorage.write(key: 'accessToken', value: accessToken);
    logger.i("saved accessToken");
  }

  saveRefreshToken(refreshToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("refreshToken", refreshToken);
    logger.i("saved refreshToken");
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    logger.i("saved firstTimeOnApp");
  }

  // getAccessToken() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   DummyData.accessToken = sharedPreferences.getString("accessToken");
  //   log("get accessToken : ${DummyData.accessToken}");
  //   return sharedPreferences.getString("accessToken");
  // }
  //
  getAccessToken() async {
    DummyData.accessToken = await _secureStorage.read(key: 'accessToken');
    log("get accessToken : ${DummyData.accessToken}");
    return await _secureStorage.read(key: 'accessToken');
  }

  Future<void> initPage() async {
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();

    notifyListeners();
  }
}

class InternetException implements Exception {
  final String message;
  InternetException(this.message);
  @override
  String toString() => message;
}

class RequestTimeoutException implements Exception {
  final String message;
  RequestTimeoutException(this.message);
  @override
  String toString() => message;
}
