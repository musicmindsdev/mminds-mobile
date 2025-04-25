import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/setup%20account/account_setup_complete_screen.dart';
import 'package:music_minds/view/screens/setup%20account/user_gender_screen.dart';
import 'package:music_minds/view/screens/setup%20account/user_genres_screen.dart';
import 'package:music_minds/view/screens/setup%20account/user_profile_screen.dart';

class EmailVerifySuccessScreen extends StatefulWidget {
  const EmailVerifySuccessScreen({super.key});

  @override
  State<EmailVerifySuccessScreen> createState() =>
      _EmailVerifySuccessScreenState();
}

class _EmailVerifySuccessScreenState extends State<EmailVerifySuccessScreen> {
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
              InkWell(
                  onTap: (){
                    navigateBack(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              SizedBox(
                height: 32.h,
              ),
              Center(
                  child: Image.asset(
                AppAsset.successTick,
                width: 137.w,
                height: 137.h,
              )),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: TextView(
                  text: TTexts.emailVerified,
                  fontSize: 24.spMin,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: TextView(
                  text: TTexts.emailSuccessfullyVerified,
                  textAlign: TextAlign.center,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                ),
              ),
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

  submitButton() {
    return DefaultButtonMain(
      text: 'Continue',
      buttonState: ButtonState.idle,
      onPressed: () {
        navigatePush(context,LoginScreen());
        // navigatePush(context, UserProfile());
      },
    );
  }
}
