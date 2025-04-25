import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/auth/login_screen.dart';

import 'package:flutter/material.dart';

class CustomAlerts {



  Future<dynamic> displayExitDialog(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: Colors.white,
          title: Center(
            child: TextView(
              text: TTexts.exitAppText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: TextView(
            text: TTexts.exitAppConfirmationText,
            fontSize: 14.sp,
            maxLines: 3,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DefaultButtonMain(
                    color: Colors.white,
                    width: 120.w,
                    textColor: AppColors.kPrimary1,
                    text: 'No',
                    borderColor: AppColors.kPrimary1,
                    borderRadius: 38.r,
                    height: 48.h,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: DefaultButtonMain(
                    color: AppColors.kPrimary1,
                    width: 120.w,
                    text: 'Yes',
                    borderColor: AppColors.kPrimary1,
                    borderRadius: 38.r,
                    height: 48.h,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }





  void displayTransactionDetailsModalSheet(context,
      {required String dateTime,
      required String transactionType,
      required String transactionForm,
      required String transactionId,
      required String status,
      required String balance,
      required int index,
      required String amount
      }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                width: double.infinity,
                // height: 500.h,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 24.0.w,
                      right: 18.w,
                      top: 18.h,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),

                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  Future<void> displaySuccessDialog(
    BuildContext context, {
    required String title,
    required String subTitle,
    bool? showText = true,
    double? height,
    btnOnePressed,
    btnOneText = "Ok",
  }) async {
    final width = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevents dialog dismissal on back button press
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: height ?? 304.h,
              width: width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h),
                    TextView(
                      text: title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    TextView(
                      text: subTitle,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    DefaultButtonMain(
                      text: btnOneText,
                      height: 42.h,
                      width: 82.w,
                      onPressed: btnOnePressed,
                      borderRadius: 8.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}

