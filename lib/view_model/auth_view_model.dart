import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/model/response/registration_successful_response_model.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/models.dart';
import 'package:music_minds/src/repository.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/auth/email_verified_success_screen.dart';
import 'package:music_minds/view/screens/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  final TextEditingController _emailController =
      TextEditingController(text: DummyData.email.toString());
  final TextEditingController _emailSignUpController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRegisterController =
      TextEditingController();
  final TextEditingController _passwordConfirmRegisterController =
      TextEditingController();
  final TextEditingController _forgotPasswordEmailController =
      TextEditingController();

  final TextEditingController _resetPasswordConfirmController =
      TextEditingController();
  final TextEditingController _resetPasswordPasswordController =
      TextEditingController();
  final TextEditingController _resetPasswordOtpController =
      TextEditingController();
  final Validators _validators = Validators();
  bool _loginObscurePass = true;
  final bool _resetPassObscurePass = true;
  final bool _resetConfirmPassObscurePass = true;
  final authService = AuthBackend();
  final loginFormKey = GlobalKey<FormState>();
  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();

  CustomButtonState _buttonState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  CustomButtonState _buttonRegisterState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );
  CustomButtonState _buttonConfirmAccountState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  TextEditingController get emailController => _emailController;
  Validators get validators => _validators;
  TextEditingController get emailSignUpController => _emailSignUpController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get otpController => _otpController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordRegisterController =>
      _passwordRegisterController;
  TextEditingController get passwordConfirmRegisterController =>
      _passwordConfirmRegisterController;
  TextEditingController get forgotPasswordEmailController =>
      _forgotPasswordEmailController;
  TextEditingController get resetPasswordConfirmController =>
      _resetPasswordConfirmController;
  TextEditingController get resetPasswordPasswordController =>
      _resetPasswordPasswordController;
  TextEditingController get resetPasswordOtpController =>
      _resetPasswordOtpController;
  bool get loginObscurePass => _loginObscurePass;
  bool get resetPassObscurePass => _resetPassObscurePass;
  bool get resetConfirmPassObscurePass => _resetConfirmPassObscurePass;
  CustomButtonState? get buttonState => _buttonState;
  CustomButtonState? get buttonRegisterState => _buttonRegisterState;
  CustomButtonState? get buttonConfirmAccountState => _buttonConfirmAccountState;

  togglePassWordVisibility() {
    _loginObscurePass = !_loginObscurePass;
    notifyListeners();
  }

  void updateButtonState() {
    final emailValidationResult =
        _validators.validateEmail(_emailController.text);

    if (emailValidationResult != null || passwordController.text.length < 8) {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: TTexts.login,
      );
    } else {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: TTexts.login,
      );
    }
    notifyListeners();
  }

  void updateRegisterButtonState() {
    final emailValidationResult =
        _validators.validateEmail(_emailSignUpController.text);
    final passwordValidateResult =
        _validators.validatePassword(_passwordRegisterController.text);
    final passwordConfirmValidateResult = _validators.validateConfirmPassword(
        _passwordRegisterController.text,
        _passwordConfirmRegisterController.text);

    if (emailValidationResult != null ||
        passwordRegisterController.text.length < 8 ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        userNameController.text.isEmpty) {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: TTexts.login,
      );
    } else {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: TTexts.login,
      );
    }
    notifyListeners();
  }

  void updateConfirmButtonState() {
    // final emailValidationResult =
    //     _validators.validateEmail(_emailSignUpController.text);
    // final passwordValidateResult =
    //     _validators./validatePassword(_passwordRegisterController.text);
    // final passwordConfirmValidateResult = _validators.validateConfirmPassword(
    //     _passwordRegisterController.text,
    //     _passwordConfirmRegisterController.text);

    if (
        otpController.text.length < 6) {
      _buttonConfirmAccountState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: TTexts.login,
      );
    } else {
      _buttonConfirmAccountState = CustomButtonState(
        buttonState: ButtonState.idle,
        text:TTexts.login,
      );
    }
    notifyListeners();
  } 

  AuthViewModel() {
    _emailController.addListener(() {
      updateButtonState();
    });
    _passwordController.addListener(() {
      updateButtonState();
    });
    _emailSignUpController.addListener(() {
      updateRegisterButtonState();
    });
    _userNameController.addListener(() {
      updateRegisterButtonState();
    });

    _passwordConfirmRegisterController.addListener(() {
      updateRegisterButtonState();
    });
    _firstNameController.addListener(() {
      updateRegisterButtonState();
    });
    _lastNameController.addListener(() {
      updateRegisterButtonState();
    });
    passwordRegisterController.addListener(() {
      updateRegisterButtonState();
    });
    otpController.addListener(() {
      updateConfirmButtonState();
    });
  }

  Future<void> userLogin(BuildContext context) async {
    try {
      _buttonState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService
          .signInAdmin(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) async {
        if (value != null) {
          final decodeResponse = value;

          if (value['status'].toString() == 'success') {
            ResponseData.loginSuccessfulResponseModel =
                LoginSuccessfulResponseModel.fromJson(
                    decodeResponse as Map<String, dynamic>);

            showToast(
              msg: 'Login successful',
              isError: false,
            );
            _buttonState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );
            DummyData.email = _emailSignUpController.text;

            DummyData.password = passwordRegisterController.text;

            await saveUserEmail(DummyData.email);
            await getUserEmail();

            await saveUserPassword(DummyData.password);
            await getUserPassword();
            await Future.delayed(Duration(milliseconds: 1000));
            await navigateReplace(context, const DashboardScreen());
          } else if (value['status'].toString() == 'error') {
            showToast(
              msg: 'Incorrect login credentials',
              isError: true,
            );
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: 'getStarted',
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger
        ..i('CHECK ERROR LOGS')
        ..e(s);
    }
  }

  Future<void> userRegistration(BuildContext context) async {
    try {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService
          .signUp(
        email: _emailSignUpController.text,
        password: _passwordRegisterController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        userName: _userNameController.text,
        role: 'user',
        profileType: 'Fan',
        profileBio: 'string',
        profileCategory: 'string',
        gender: 'male',
        genres: 'string',
      )
          .then((value) async {
        if (value != null) {
          // print(value['status'].toString());
          //   final decodeResponse = jsonDecode(value.toString());
          final decodeResponse = value;
          if (value['status'].toString() == 'success') {
            logger.wtf(value.toString());
            // var decodeResponse = jsonDecode(value);

            ResponseData.registrationSuccessfulResponseModel =
                RegistrationSuccessfulResponseModel.fromJson(
                    decodeResponse as Map<String, dynamic>);
            // DummyData.email =ResponseData.registrationSuccessfulResponseModel!.data!.email.toString();
            DummyData.email = _emailSignUpController.text;
            // DummyData.password =
            //     passwordRegisterController.text;
            DummyData.password = passwordRegisterController.text;
            await saveUserEmail(DummyData.email);
            await getUserEmail();

            await saveUserPassword(DummyData.password);
            await getUserPassword();
            _buttonRegisterState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );

            showToast(
              msg: value['message'].toString(),
              isError: false,
            );
            await Future.delayed(Duration(milliseconds: 1000));
            await navigateReplace(context, const VerifyEmailScreen());
          } else if (value['status'].toString() == 'error') {
            showToast(
              msg: value['message'].toString(),
              isError: true,
            );
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonRegisterState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: 'getStarted',
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger
        ..i('CHECK ERROR LOGS')
        ..e(s);
    }
  }

  Future<void> userConfirmAccount(BuildContext context) async {
    try {
      _buttonConfirmAccountState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await authService.confirmUserAccount(
        email: DummyData.email.toString(),
        otp: _otpController.text,
      )
          .then((value) async {
        if (value != null) {
          final decodeResponse = value;

          if (value['status'].toString() == 'success') {
            // ResponseData.loginSuccessfulResponseModel =
            //     LoginSuccessfulResponseModel.fromJson(
            //         decodeResponse as Map<String, dynamic>);

            showToast(
              msg: 'Verification successful',
              isError: false,
            );
            _buttonState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );
            // DummyData.email = _emailSignUpController.text;
            //
            // DummyData.password = passwordRegisterController.text;

            // await saveUserEmail(DummyData.email);
            // await getUserEmail();
            //
            // await saveUserPassword(DummyData.password);
            // await getUserPassword();
            await Future.delayed(Duration(milliseconds: 1000));
            await navigatePush(context, const EmailVerifySuccessScreen());
          } else if (value['status'].toString() == 'error') {
            showToast(
              msg: 'Incorrect login credentials',
              isError: true,
            );
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: 'getStarted',
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: 'Something went wrong',
        isError: true,
      );
      logger
        ..i('CHECK ERROR LOGS')
        ..e(s);
    }
  }

  saveUserEmail(localUserEmail) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", localUserEmail);
    logger.i("saved Email Address ${DummyData.email}");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password");
  }

  getUserEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.email = sharedPreferences.getString("Email");
    logger.i("get Email Address ${DummyData.email}");
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password ${DummyData.password}");
  }

  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
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

  getAccessToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.accessToken = sharedPreferences.getString("accessToken");
    log("get accessToken : ${DummyData.accessToken}");
  }
}
