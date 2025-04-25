import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/model/local/dummy_data.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/auth/email_verified_success_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../view_model/auth/auth_view_model.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  final String? email;
  final String? pwd;
  final String? title;
  final String? subTitle;
  final bool? isForgotPassword;
  const VerifyEmailScreen( {super.key,this.email, this.pwd, this.title, this.subTitle, this.isForgotPassword,});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  bool isObscure = true;
  bool isCountdownStopped = true;
  late String dongleId;
  int _secondsRemaining = 60;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {

      if (_secondsRemaining == 0) {
        setState(() {
          isCountdownStopped= !isCountdownStopped;
        });
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
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
                height: 58.h,
              ),
              pinCodeField(),
              SizedBox(
                height: 20.h,
              ),
              resendWidget()
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
          text: TTexts.verifyEmail,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),
        TextView(
          text: TTexts.enterCode,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.KTextGrey,
        ),
        TextView(
          text: DummyData.email.toString(),
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.KTextBlack,
        ),
      ],
    );
  }

  resendWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
          text: TTexts.didNotReceiveCode,
          fontSize: 12.spMin,
          fontWeight: FontWeight.w500,
          color: AppColors.KTextGrey,
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
              gradient: isCountdownStopped?AppColors.gradientMain:AppColors.disabledGradient,
              borderRadius: BorderRadius.circular(4.r)),
          child: Center(
            child: TextView(
              text: 'Resend in ${_secondsRemaining}s',
              color: Colors.white,
              fontSize: 12.spMin,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  pinCodeField() {
    var authProvider = ref.watch(authViewModel);
    return PinCodeTextField(
      appContext: context,
      obscuringCharacter: '*',
      length: 6,
      // controller: provider.otpController,
      obscureText: isObscure,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      cursorColor: AppColors.kAshBlue,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      onChanged: (value) =>
          authProvider.updateVerifyButtonState(value),
      // hintCharacter: '-',
      hintStyle: const TextStyle(
        color: AppColors.kAshBlue,
        fontFamily: TTexts.campTonFont,
      ),

      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5.r),
          fieldHeight: 42.h,
          fieldWidth: 42.w,
          activeColor: AppColors.KBlue,
          activeFillColor: AppColors.kAshBlue,
          selectedFillColor: AppColors.kAshBlue,
          disabledColor: AppColors.kAshBlue,
          inactiveFillColor: AppColors.kAshBlue,
          inactiveColor: AppColors.KNeutral,
          selectedColor: AppColors.KNeutral,
          borderWidth: 0.2.r),
      animationDuration: Duration(milliseconds: 300),
    );
  }

  submitButton() {
    var authProvider = ref.watch(authViewModel);
    return DefaultButtonMain(
      text: 'Next',
      buttonState: authProvider.buttonVerifyState!.buttonState,
      onPressed: () async {
        // await provider.userConfirmAccount(context);
        navigatePush(context, EmailVerifySuccessScreen());
      },
    );
  }


}
