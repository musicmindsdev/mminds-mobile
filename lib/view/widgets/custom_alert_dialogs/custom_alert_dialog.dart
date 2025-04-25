import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 abstract class CustomAlertDialog{

  final List<Widget> widgets;
  final Color? backgroundColor;

  CustomAlertDialog(this.widgets, this.backgroundColor);

  void  showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Allows closing by tapping outside
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // Semi-transparent background
      transitionDuration: const Duration(milliseconds: 300), // Animation duration
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dialog
              Material(
                type: MaterialType.card,
                color: backgroundColor ?? Colors.white,
                elevation: 4,
                borderRadius: BorderRadius.circular(30.r),
                child: SizedBox(
                  width: 390.w,
                  // height: 500.h,
                  child: Column(
                    children: widgets,
                  ),
                ),
              ),
              // Spacer between dialog and button
              const SizedBox(height: 10),
              // Circular red button
              GestureDetector(
                onTap: () {
                navigateGoRouterBack(context);
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration:  const BoxDecoration(
                    color: AppColors.kWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Icon(CupertinoIcons.clear, size: 24.r,),),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {

        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn, // Smooth easing for a natural feel
            ),
          ),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}