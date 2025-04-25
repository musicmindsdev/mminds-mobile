import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/auth/reset_password_screens/set_new_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              headerTexts(),
              SizedBox(
                height: 32.h,
              ),
              formFields()

            ],
          ),
        ),
      ),
      bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: submitButton(),
          )),
    );
  }

  Widget headerTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: (){
              navigateBack(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 15.h,
        ),
        TextView(
          text: TTexts.resetPwd,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),

        TextView(
          text: TTexts.enterEmailLinked,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.KTextBlack,
        ),
      ],
    );
  }

  Widget formFields() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomTextField(
          fieldLabel: '',
          hint: "Email Address", focusNode: passwordFocusNode,
        ),

      ],
    );
  }
  submitButton() {
    return  DefaultButtonMain(
      text: 'Continue',
      buttonState: ButtonState.idle,
      onPressed: (){
        navigatePush(context, const SetNewPasswordScreen());
      },
    );
  }
}
