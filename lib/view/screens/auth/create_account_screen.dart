import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/repository/backend/auth_backend.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/components/custom_password/validate_field.dart';
import 'package:music_minds/view_model/auth/auth_view_model.dart';
import 'package:music_minds/view_model/auth/registration_view_model.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  bool isChecked = false;
  final authService = AuthBackend();

  @override
  Widget build(BuildContext context) {
    var registrationProvider = ref.watch(registrationViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                headerTexts(),
                SizedBox(height: 30.h),
                formFields(),
                SizedBox(height: 12.h),
                termsAndPolicies(),
                SizedBox(height: 50.h),
                submitButton(),
                SizedBox(height: 28.h),
                alreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //This contains the Back Button and Header Texts
  Widget headerTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            navigateBack(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        SizedBox(height: 15.h),
        TextView(
          text: TTexts.createAnAccount,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 6.h),
        TextView(
          text: TTexts.joinTheCommunity,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  //Contains a list of form fields
  Widget formFields() {
    var registrationProvider = ref.watch(registrationViewModel);
    return Form(
      key: registrationProvider.registrationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            fieldLabel: '',
            hint: TTexts.firstName,
            controller: registrationProvider.firstNameController,
            validator: (value) => Validators().validateName(value),
            onChanged: (value) {
              logger.wtf("hello");
              registrationProvider.updateRegisterButtonState();
            },
          ),
          CustomTextField(
            fieldLabel: '',
            hint: TTexts.lastName,
            validator: (value) => Validators().validateName(value),
            controller: registrationProvider.lastNameController,
            onChanged:
                (value) => registrationProvider.updateRegisterButtonState(),
          ),

          CustomTextField(
            fieldLabel: '',
            hint: TTexts.userName,
            controller: registrationProvider.userNameController,
            validator: (value) => Validators().validateEmptyField(value),
            onChanged:
                (value) => registrationProvider.updateRegisterButtonState(),
          ),
          CustomTextField(
            fieldLabel: '',
            hint: TTexts.emailAddress,
            controller: registrationProvider.registerEmailController,
            validator: (value) => Validators().validateEmail(value),
            onChanged:
                (value) => registrationProvider.updateRegisterButtonState(),
          ),


          PasswordValidatedFields(
            textEditingController:
            registrationProvider.registerPwdController,
            obscureInput: registrationProvider.obscurePasswordText,
            confirmPasswordWidget: CustomTextField(
              fieldLabel: TTexts.confirmPassword,
              hint: TTexts.confirmPassword,
              controller:
              registrationProvider.registerConfirmPwdController,
              password: true,
              validator: (value) =>
                  Validators().validateConfirmPassword(
                    registrationProvider.registerPwdController.text,
                    registrationProvider
                        .registerConfirmPwdController.text,
                  ),
              obscureInput:
              registrationProvider.obscureConfirmPwdText,
              onObscureText:
              registrationProvider.toggleConfirmPwdVisibility,
            ),
            onObscureText: registrationProvider.togglePwdVisibility,

            fieldLabel: TTexts.password,
          ),
        ],
      ),
    );
  }

  //Contains custom button
  submitButton() {
    var registrationProvider = ref.watch(registrationViewModel);
    return DefaultButtonMain(
      text: TTexts.createAccount,
      buttonState: registrationProvider.buttonRegisterState!.buttonState,
      onPressed: () async {
        registrationProvider.userRegistration(context);
      },
    );
  }

  //Contains alreadyHaveAnAccount text widget
  alreadyHaveAnAccount() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: TTexts.haveAnAccount,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.spMin,
            fontFamily: TTexts.campTonFont,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: TTexts.login,
              style: TextStyle(
                color: AppColors.KBlue,
                fontSize: 14.spMin,
                fontWeight: FontWeight.w500,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap =
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  //Contains termsAndPolicies text widget
  termsAndPolicies() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customCheckBox(),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: TTexts.agreeTo,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.spMin,
                fontFamily: TTexts.campTonFont,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: TTexts.termsOfService,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.KBlue.withOpacity(0.8),
                    fontSize: 10.spMin,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(text: TTexts.acknowledgement),
                TextSpan(
                  text: TTexts.privacyPolicy,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.KBlue.withOpacity(0.8),
                    fontSize: 10.spMin,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(text: ' applies to you.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Contains customCheckBox widget
  customCheckBox() {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 18.w, // Adjust the size of the checkbox
        height: 18.h, // Adjust the size of the checkbox
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), // Set the border radius
          border: Border.all(
            color: AppColors.KBlue, // Border color
            width: 1.w, // Border width
          ),
          color:
              isChecked
                  ? Colors.transparent
                  : Colors.transparent, // Fill color when checked
        ),
        child:
            isChecked
                ? Center(
                  child: Icon(
                    Icons.check,
                    size: 12.0.r,
                    color: AppColors.KBlue, // Checkmark color
                  ),
                )
                : null,
      ),
    );
  }
}
