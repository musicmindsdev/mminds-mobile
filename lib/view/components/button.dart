import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

import 'gradient_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.buttonState = ButtonState.idle,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        /// This line of code is setting the background color of the button. It checks the value of the
        /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
        /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
        /// which is passed in when the function is called. If `color` is null, it sets the color to a
        /// default value of `const Color(0xFF09132D)`.
        color: (buttonState == ButtonState.disabled)
            ? AppColors.kPrimary2
            : color ?? const Color(0xFF09132D),
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
      ),
      child: ButtonTheme(
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(color: AppColors.kWhite),
                  )
                : Text(
                    text.toString(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 17.0,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class DefaultButtonMain extends StatelessWidget {
  const DefaultButtonMain({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.buttonState = ButtonState.idle,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 47.0.h,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        /// This line of code is setting the background color of the button. It checks the value of the
        /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
        /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
        /// which is passed in when the function is called. If `color` is null, it sets the color to a
        /// default value of `const Color(0xFF09132D)`.
        // color: (buttonState == ButtonState.disabled)
        //     ? AppColors.kPrimary2
        //     : color ?? const Color(0xFF09132D),
        gradient: (buttonState == ButtonState.disabled)
            ? AppColors.disabledGradient
            : AppColors.gradientMain,
        // border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
      ),
      child: ButtonTheme(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: height ?? 47.0.h,

          onPressed: (buttonState == ButtonState.disabled || buttonState == ButtonState.loading)
              ? null
              : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 8.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(color: AppColors.kWhite),
                  )
                : Text(
                    text.toString(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 14.0.spMin,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontFamily: TTexts.campTonFont,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class DefaultPinkButtonMain extends StatelessWidget {
  const DefaultPinkButtonMain({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.buttonState = ButtonState.idle,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 47.0.h,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: color,

          /// This line of code is setting the background color of the button. It checks the value of the
          /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
          /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
          /// which is passed in when the function is called. If `color` is null, it sets the color to a
          /// default value of `const Color(0xFF09132D)`.
          // color: (buttonState == ButtonState.disabled)
          //     ? AppColors.kPrimary2
          //     : color ?? const Color(0xFF09132D),
          // gradient: (buttonState == ButtonState.disabled) ?AppColors.disabledGradient:AppColors.gradientMain,
          // border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
          border: Border.all(color: borderColor!, width: 1.sp)),
      child: ButtonTheme(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: height ?? 47.0.h,

          onPressed: (buttonState == ButtonState.disabled) ? null : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 8.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(color: AppColors.kWhite),
                  )
                : GradientText(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.KLinearGradient1,
                        AppColors.KLinearGradient2,
                        AppColors.KLinearGradient3,
                      ],
                    ),
                    text: text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 14.0.spMin,
                      fontWeight: fontWeight ?? FontWeight.w500,
                     fontFamily: TTexts.campTonFont,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// class DefaultImageButtonMain extends StatelessWidget {
//   const DefaultImageButtonMain({
//     super.key,
//     this.onPressed,
//     this.imagePath,
//     this.color,
//     this.textColor,
//     this.borderRadius,
//     this.width,
//     this.height,
//     this.padding,
//     this.fontSize,
//     this.fontWeight,
//     this.borderColor,
//     this.buttonState = ButtonState.idle,
//   });
//   final VoidCallback? onPressed;
//   final String? imagePath;
//   final Color? color;
//   final Color? textColor;
//   final double? borderRadius;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? borderColor;
//   final ButtonState buttonState;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height ?? 47.0.h,
//       width: width,
//       padding: padding,
//       decoration: BoxDecoration(
//           color:color ,
//           /// This line of code is setting the background color of the button. It checks the value of the
//           /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
//           /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
//           /// which is passed in when the function is called. If `color` is null, it sets the color to a
//           /// default value of `const Color(0xFF09132D)`.
//           // color: (buttonState == ButtonState.disabled)
//           //     ? AppColors.kPrimary2
//           //     : color ?? const Color(0xFF09132D),
//           // gradient: (buttonState == ButtonState.disabled) ?AppColors.disabledGradient:AppColors.gradientMain,
//           // border: Border.all(color: borderColor ?? Colors.transparent),
//           borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
//           border: Border.all(color: borderColor!, width: 1.sp)
//       ),
//       child: ButtonTheme(
//         child: MaterialButton(
//           padding: EdgeInsets.zero,
//           height: height ?? 47.0.h ,
//
//           onPressed:(buttonState == ButtonState.disabled)?null: onPressed,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r), // Adjust the radius as needed
//           ),
//           // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
//           child: Center(
//             /// This code is setting the child of the `TextButton` widget. It checks the value of the
//             /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
//             /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
//             /// that the button is in a loading state and the user should wait for the action to complete.
//             /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
//             /// widget with the `text` parameter passed in when the function is called. The `textColor`,
//             /// `fontSize`, and `fontWeight` parameters are also used to style the text.
//             child: (buttonState == ButtonState.loading)
//                 ? const SizedBox.square(
//               dimension: 30,
//               child: CircularProgressIndicator(color: AppColors.kWhite),
//             )
//                 : GradientText(
//               gradient: const LinearGradient(
//                 colors: [
//                   AppColors.KLinearGradient1,
//                   AppColors.KLinearGradient2,
//                   AppColors.KLinearGradient3,
//                 ],
//               ),
//               text: text,
//               style: TextStyle(
//                 color: textColor ?? Colors.white,
//                 fontSize: fontSize ?? 14.0.spMin,
//                 fontWeight: fontWeight ?? FontWeight.w500,
//                fontFamily: TTexts.campTonFont,
//               ),
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }

class DefaultBackButton extends StatelessWidget {
  DefaultBackButton({super.key, required this.onTap});

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          size: 28.spMin,
          color: AppColors.KBlack,
        ),
      ),
    );
  }
}

class DefaultRatingButton extends StatelessWidget {
  DefaultRatingButton({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 23.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration:
          BoxDecoration(color: AppColors.KPinkRating, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextView(
            text: text,
            color: AppColors.KPurpleRating,
            fontSize: 10.spMin,
            fontWeight: FontWeight.w500,
          ),
          Center(
              child: Image.asset(
            AppAsset.starRatingIcon,
            width: 9.40.w,
            height: 9.40.h,
          ))
        ],
      ),
    );
  }
}

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({
    super.key,
    required this.width,
    required this.color,
    required this.thickness,
  });
  final double width;
  final Color color;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 2.0.h,
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.height,
    required this.onTap,
    this.padding,
    required this.radius,
    required this.width,
    required this.text,
  });
  final double width;
  final double height;
  final EdgeInsets? padding;
  final double radius;
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.KBorderColor,
        ),
      ),
      child: Center(
        child: TextView(
          onTap: onTap,
          text: text,
          fontWeight: FontWeight.w400,
          fontSize: 14.spMin,
          color: AppColors.KBlack,
          fontFamily:  TTexts.campTonFont,
        ),
      ),
    );
  }
}
