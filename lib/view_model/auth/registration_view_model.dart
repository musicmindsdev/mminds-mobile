import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/config/app_strings.dart';
import 'package:music_minds/src/models.dart';
import 'package:music_minds/src/repository.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/auth/verify_email_screen.dart';

final registrationViewModel =
    ChangeNotifierProvider((ref) => RegistrationViewModel());

// Define the provider
final registrationViewModelProvider = ChangeNotifierProvider.autoDispose(
      (ref) => RegistrationViewModel(),
);

class RegistrationViewModel extends ChangeNotifier {
  final authService = AuthBackend();
  final registrationFormKey = GlobalKey<FormState>();

  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPwdController = TextEditingController();
  final TextEditingController _registerPhoneController =
      TextEditingController();
  final TextEditingController _registerConfirmPwdController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fullNameNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  final TextEditingController _refCodeController = TextEditingController();
  CustomButtonState _buttonRegisterState = CustomButtonState(
    buttonState: ButtonState.disabled,
    text: TTexts.createAccount,
  );

  bool _obscurePasswordText = true;
  bool _obscureConfirmPwdText = true;
  bool _isChecked = false;
  bool isRegisteringUser = false;

  bool get isChecked => _isChecked;

  TextEditingController get registerEmailController => _registerEmailController;
  TextEditingController get registerPwdController => _registerPwdController;
  TextEditingController get registerPhoneController => _registerPhoneController;
  TextEditingController get registerConfirmPwdController =>
      _registerConfirmPwdController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get refCodeController => _refCodeController;
  CustomButtonState? get buttonRegisterState => _buttonRegisterState;
  bool get obscurePasswordText => _obscurePasswordText;

  bool get obscureConfirmPwdText => _obscureConfirmPwdText;

  void togglePwdVisibility() {
    _obscurePasswordText = !_obscurePasswordText;
    notifyListeners();
  }

  void toggleConfirmPwdVisibility() {
    _obscureConfirmPwdText = !_obscureConfirmPwdText;
    notifyListeners();
  }

  void toggleCheckerVisibility() {
    _isChecked = !_isChecked;
    updateRegisterButtonState();
    notifyListeners();
  }

  void updateRegisterButtonState() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty||
        _userNameController.text.isEmpty || _registerEmailController.text.isEmpty || _registerPwdController.text.isEmpty) {
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

  Future<void> userRegistration(BuildContext context) async {
    if (registrationFormKey.currentState!.validate()) {
      registrationFormKey.currentState!.save();

      try {
        _buttonRegisterState = CustomButtonState(
          buttonState: ButtonState.loading,
          text: TTexts.createAccount,
        );
        isRegisteringUser = true;
        notifyListeners();
        await authService
            .signUp(
          email: _registerEmailController.text.trim(),
          userName: _userNameController.text.trim(),
          fullName: _fullNameNameController.text.trim(),
          password: _passwordController.text.trim(),
        )
            .then((value) async {
          if (value != null) {
            // print(value['status'].toString());
            //   final decodeResponse = jsonDecode(value.toString());
            final decodeResponse = value;
            logger.w(decodeResponse);
            if (value['status'].toString() == 'success') {
              _buttonRegisterState = CustomButtonState(
                buttonState: ButtonState.idle,
                text: TTexts.createAccount,
              );

              showToast(
                msg: value['message'].toString(),
                isError: false,
              );
              DummyData.emailAddress = _registerEmailController.text.toString();
              isRegisteringUser = false;
              // AuthViewModel().userAutoLogin(context,
              //     email: _registerEmailController.text,
              //     password: registerPwdController.text);
              navigatePush(
                  context,
                  VerifyEmailScreen(
                    // title: TTexts.otpVerificationText,
                    // subTitle: TTexts.sixDigitOtpText,
                    email: _registerEmailController.text.toString(),
                    pwd: _registerPwdController.text.toString(),
                  ));
              showToast(
                msg: value['message'].toString(),
                isError: false,
              );
            } else {
              showToast(
                msg: value['data'].toString(),
                isError: true,
              );
            }
          }
        }).whenComplete(() {
          _buttonRegisterState = CustomButtonState(
            buttonState: ButtonState.idle,
            text: TTexts.createAccount,
          );
          isRegisteringUser = false;
          notifyListeners();
        });
      } catch (e, s) {
        // showToast(
        //   // msg: somethingWentWrong,
        //   isError: true,
        // );
        logger
          ..i('')
          ..e(s);
      }
    }
  }

  TextEditingController get fullNameNameController => _fullNameNameController;
}
