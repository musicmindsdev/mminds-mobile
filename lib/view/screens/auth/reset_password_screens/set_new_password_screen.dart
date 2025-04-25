import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/utils.dart';
class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool obscurePasswordText =true;
  bool obscureConfirmPasswordText =true;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  
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
          text: TTexts.setNewPassword,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),
        TextView(
          text: TTexts.setNewPasswordTextInfo,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  //Contains a list of form fields
  Widget formFields() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomTextField(
          fieldLabel: '',
          hint: "Password",
          password: true,
          obscureInput: obscurePasswordText,
          onObscureText: (){
            togglePassWordVisibility();
          }, focusNode: passwordFocusNode,
        ),
        CustomTextField(
          fieldLabel: '',
          hint: "Confirm Password",
          visibleField: true,
          password: true,
          obscureInput: obscureConfirmPasswordText,
          onObscureText: (){
            toggleConfirmPassWordVisibility();
          }, focusNode: confirmPasswordFocusNode,
          // useForgotPass: true,
        ),
      ],
    );
  }

  //Contains togglePassWordVisibility for password form field widget
  togglePassWordVisibility() {
    setState(() {
      obscurePasswordText = !obscurePasswordText;
    });
  }

  toggleConfirmPassWordVisibility() {
    setState(() {
      obscureConfirmPasswordText = !obscureConfirmPasswordText;
    });
  }
  //Contains custom button
  submitButton() {
    return  DefaultButtonMain(
      text: 'Reset password',
      buttonState: ButtonState.idle,
      onPressed: (){
        // navigatePush(context, VerifyEmailScreen());
      },
    );
  }


}
