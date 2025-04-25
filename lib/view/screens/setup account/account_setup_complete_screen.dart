import 'package:flutter/material.dart';
import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/dashboard/dashboard_screen.dart';

class AccountSetupComplete extends StatefulWidget {
  AccountSetupComplete({Key? key}) : super(key: key);

  @override
  State<AccountSetupComplete> createState() => _AccountSetupCompleteState();
}

class _AccountSetupCompleteState extends State<AccountSetupComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 30.h,
          ),
          child: Column(
            children: [
              DefaultBackButton(
                onTap: () {
                  navigateBack(context);
                },
              ),
              Align(
                child: SizedBox(
                  // height: 300.h,
                  // width: 284.w,
                  child: Column(
                    children: [
                      const Gap(50),
                      SizedBox(
                        height: 136.4.h,
                        width: 139.w,
                        child: Image(
                          image: AssetImage(
                            AppAsset.successTick
                          ),
                        ),
                      ),
                      const Gap(30),
                      SizedBox(


                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(text: "Account setup complete",fontWeight: FontWeight.w600,
                              fontSize: 24.spMin,),
                            const Gap(12),
                            TextView(text: "Your account setup is complete",fontWeight: FontWeight.w400,
                              fontSize: 14.spMin,),

                           
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(270.spMin),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child:
               DefaultButtonMain(text: "Continue", onPressed: (){
                 navigatePush(context, DashboardScreen());
               },)
              ),
            ],
          ),
        ),
      ),
    );
  }
}


