import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingCircularButton extends StatelessWidget {
  const OnboardingCircularButton({
    super.key,
    this.child,
    this.childColor,
    this.colour,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final IconData? child;
  final Color? colour;
  final Color? childColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colour,
      onPressed: onPressed,
      height: 58.h,
      minWidth:58.w ,
      shape: const CircleBorder(),
      child: Icon(
        child,

        color: childColor,
        size: 24.spMin,
      ),
    );
  }
}
