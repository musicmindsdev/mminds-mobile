import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralAlertDialog {
  void showStatusDialog(BuildContext context,
      {required bool isSuccessAlert,
      required String subTitleText,
      required String titleText,
      bool? showButton = true,
      String? buttonText,
      VoidCallback? onButtonPressed}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Allows closing by tapping outside
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // Semi-transparent background
      transitionDuration:
          const Duration(milliseconds: 300), // Animation duration
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dialog
              Material(
                type: MaterialType.card,
                color:
                    isSuccessAlert ? AppColors.kPrimaryColor : AppColors.kPrimaryColor,
                elevation: 4,
                borderRadius: BorderRadius.circular(30.r),
                child: SizedBox(
                  width: 390.w,
                  height: 780.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                child: StatusDetails(
                                  titleText: titleText,
                                  subTitleText: subTitleText,
                                ),
                              )
                            ],
                          ),
                        ),
                        showButton == true
                            ? DefaultButtonMain(
                                text: buttonText, onPressed: onButtonPressed)
                            : const SizedBox(),
                      ],
                    ),
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
                  decoration: const BoxDecoration(
                    color: AppColors.kWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.clear,
                      size: 24.r,
                    ),
                  ),
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

class StatusDetails extends StatefulWidget {
  final String titleText;
  final String subTitleText;
  const StatusDetails(
      {super.key, required this.titleText, required this.subTitleText});

  @override
  State<StatusDetails> createState() => _StatusDetailsState();
}

class _StatusDetailsState extends State<StatusDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextView(
          text: widget.titleText,
          color: Colors.white,
          fontSize: 40.spMin,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w900,
          maxLines: 4,
        ),
        TextView(
          text: widget.subTitleText,
          color: Colors.white,
          fontSize: 18.spMin,
          textAlign: TextAlign.center,
          maxLines: 4,
        )
      ],
    );
  }
}
