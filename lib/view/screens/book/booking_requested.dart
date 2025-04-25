import 'package:flutter/material.dart';

import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/navigators.dart';

import 'package:flutter/services.dart';
import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/view/screens/book/error_or_failed_screen.dart';

class BookingRequestedScreen extends StatelessWidget {
  const BookingRequestedScreen({Key? key}) : super(key: key);

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
              Align(
                alignment: AlignmentDirectional.topStart,
                child: InkWell(
                  onTap: () {
                    navigateBack(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 28.spMin,
                    color: AppColors.KBlack,
                  ),
                ),
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
                          image: AssetImage(AppAsset.successTick),
                        ),
                      ),
                      const Gap(30),
                      SizedBox(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              color: AppColors.KBlack,
                              text: "Booking requested!",
                              fontWeight: FontWeight.w600,
                              fontSize: 24.spMin,
                            ),
                            const Gap(12),
                            TextView(
                              color: AppColors.KBlack,
                              text: "You've successfully completed your booking\n"
                                  "request. we'll notify you once confirmed by\n"
                                  "Gilbert Wilson",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.spMin,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(350.spMin),
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: DefaultButtonMain(
                    text: "Continue",
                    onPressed: () {
                      navigatePush(context, const FailedScreen());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
