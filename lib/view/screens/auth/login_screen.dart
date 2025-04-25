import 'package:flutter/gestures.dart';
import 'package:music_minds/model/local/dummy_data.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/view/screens/dashboard/dashboard_screen.dart';
import 'package:music_minds/view_model/auth/auth_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
     ref.watch(authViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                headerTexts(),
                SizedBox(
                  height: 30.h,
                ),
                formFields(),
                // TextView(text: DummyData.email.toString(), color: Colors.red,),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Padding(
           padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: submitButton(),
              ),

              SizedBox(
                height: 20.h,
              ),
              dontHaveAccount(),
            ],
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
            child: const Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 15.h,
        ),
        TextView(
          text: TTexts.loginToAcc,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),
        TextView(
          text: TTexts.welcomeBack,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  //Contains a list of form fields
  Widget formFields() {
    var provider = ref.watch(authViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          fieldLabel: '',
          hint: "Email Address or Username",
          controller: provider.emailController, focusNode: emailFocusNode,

        ),

        CustomTextField(
          fieldLabel: '',
          hint: "Password",
          password: true,
          obscureInput: provider.loginObscurePass,
          controller: provider.passwordController,
          onForgotPassTap: () {
            navigatePush(context, const ResetPasswordScreen());
          },
          onObscureText: provider.togglePassWordVisibility,
          visibleField: true,
          useForgotPass: true, focusNode: passwordFocusNode,
        ),

        // useForgotPass: true,
      ],
    );
  }

  //Contains custom button
  submitButton() {
    var provider = ref.watch(authViewModel);
    return DefaultButtonMain(
      text: 'Login',
      buttonState: provider.buttonState!.buttonState,
      onPressed: () async {
        // await provider.userLogin(context);
        navigatePush(context,  DashboardScreen());
      },
    );
  }

  //Contains alreadyHaveAnAccount text widget
  dontHaveAccount() {
    return Center(
      child: RichText(
          text: TextSpan(
              text: TTexts.dontHaveAnAccount,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.spMin,
                  fontFamily: TTexts.campTonFont,
                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
            TextSpan(
                text: TTexts.signUp,
                style: TextStyle(
                    color: AppColors.KBlue,
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen()))),
          ])),
    );
  }
}
