import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/providers.dart';
import 'package:music_minds/config/app_colors.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/view_model/auth/auth_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    // ref.watch(authViewModel).getUserEmail();
    ref.watch(onboardingViewModel).checkUser(context);
    // ref.watch(authViewModel).updateButtonState();
    // ref.watch(authViewModel).updateRegisterButtonState();
    super.didChangeDependencies();
  }
  @override
  void initState() {
    super.initState();
    
    // Use Future.delayed to update the providers after the widget is built
    Future.delayed(Duration.zero, () {
      ref.watch(authViewModel).getUserEmail();
      ref.watch(onboardingViewModel).checkUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.KTextBlack,
      body: Center(
          child: SizedBox(
        width: 208.w,
        height: 101.h,
        child: Image(
          image: AssetImage(
            AppAsset.appLogo,
          ),
        ),
      )),
    );
  }
}
