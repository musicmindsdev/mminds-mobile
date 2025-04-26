import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_minds/config/app_colors.dart';
import 'package:music_minds/src/components.dart';

void showToast({
  required String msg,
  required bool isError,
  bool isNeutralMessage = false,
}) {
  IconData icon = isNeutralMessage
      ? CupertinoIcons.info_circle_fill
      : isError
      ? CupertinoIcons.xmark_circle_fill
      : CupertinoIcons.check_mark_circled_solid;

  Color backgroundColor = isNeutralMessage
      ? Colors.grey.shade600
      : isError
      ? AppColors.kRedLight
      : AppColors.kGreenLight;

  Color textColor = isNeutralMessage? Colors.white: isError?AppColors.kRedToastText:AppColors.kGreenToastText; // White text for better contrast
  Color iconColor =isNeutralMessage? Colors.white:isError?AppColors.kRedToastText:AppColors.kGreenToastText ; // White icon color
  Duration toastDuration = const Duration(milliseconds: 5300);

  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor, // Background color is now Green/Red
          borderRadius: BorderRadius.circular(8.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: backgroundColor.withOpacity(0.3),
          //     blurRadius: 6.r,
          //     offset: const Offset(0, 3),
          //   )
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, color: iconColor),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextView(
                      text: msg,
                      maxLines: 3,
                      color: textColor, // Text color is now white
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.xmark, color: iconColor,),
              onPressed: cancelFunc,
            ),
          ],
        ),
      );
    },
    align: Alignment.topRight,
    duration: toastDuration,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 200),
  );
}
