import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();
  static final _instance = AppTheme._();
  static AppTheme get instance => _instance;

//   static ThemeData lightTheme = ThemeData(
//
//     dividerColor: AppColors.kDisabledButton,
//     brightness: Brightness.light,
//     primarySwatch: Colors.blue,
//
//
//     fontFamily: TTexts.kumbhSansFont,
//     canvasColor: AppColors.kWhite,
//     colorScheme: ColorScheme.fromSeed(
//
//       errorContainer: AppColors.kErrorContainer,
//       background: AppColors.kTransparent,
//       seedColor: Colors.white,
//       primary: AppColors.kPrimaryColor,
//       surfaceTint: Colors.white,
//       error: AppColors.kErrorPrimary,
//       secondary: AppColors.kBlack4,
//       outline: AppColors.kDisabledButton,
//       onPrimaryContainer: AppColors.kFadedBlue,
//       tertiary: AppColors.kAshBlue,
//     ),
//     bottomAppBarTheme: const BottomAppBarTheme(color: Colors.red),
//     primaryColor: AppColors.kPrimary1,
//     indicatorColor: AppColors.kPrimary2,
//     // canvasColor: AppColors.lightCanvasColor,
//     // dividerColor: AppColors.lightDividerColor,
//     // dialogBackgroundColor: AppColors.lightBackgroundColor,
//     scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//
//     // colorScheme: const ColorScheme.light(
//     //     secondary: AppColors.lightSecondaryColor,
//     //     primary: AppColors.lightSecondaryColor,
//     //     background: AppColors.lightBackgroundColor,
//     //     brightness: Brightness.light),
//     // checkboxTheme: ThemeData.light().checkboxTheme.copyWith(
//     //       shape: RoundedRectangleBorder(
//     //         borderRadius: BorderRadius.circular(3),
//     //       ),
//
//     //     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0.0,
//       titleTextStyle: ThemeData.light()
//           .textTheme
//           .titleLarge!
//           .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
//       iconTheme: ThemeData.light().iconTheme,
//       color: AppColors.kTransparent,
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.light,
//       ),
//     ),
//     textTheme: TextTheme(
//       titleLarge: TextStyle(
//         fontSize: 22.sp,
//         fontWeight: FontWeight.w600,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextBlack,
//       ),
//       titleMedium: TextStyle(
//         fontFamily: TTexts.kumbhSansFont,
//         fontSize: 15.sp,
//         fontWeight: FontWeight.w400,
//         color: AppColors.kSubText,
//       ),
//       headlineSmall: TextStyle(
//         fontSize: 30.sp,
//         fontWeight: FontWeight.w600,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextBlack,
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w400,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextBlack,
//       ),
//     ),
//   );
//
//
//   static ThemeData darkTheme = ThemeData(
//     primaryColorLight: AppColors.kPrimary150,
// cardColor: AppColors.kContainerBackground,
//       brightness: Brightness.dark,
//     primaryColor: AppColors.kPrimary1,
//     dividerColor: AppColors.kDarkDividerColor,
//     scaffoldBackgroundColor: AppColors.kBackgroundDark,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//     fontFamily: TTexts.kumbhSansFont,
//       colorScheme: const ColorScheme.dark(
//         secondary: AppColors.kDarkSecondary,
//         primary: AppColors.kTextWhite,
//         surface: AppColors.kBackgroundDark,
//         tertiary: AppColors.kTextDark,
//           brightness: Brightness.dark),
//       checkboxTheme: ThemeData.dark().checkboxTheme.copyWith(
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
//       ),
//     indicatorColor: AppColors.kPrimary150,
//
//       appBarTheme: AppBarTheme(
//           elevation: 0.0,
//           titleTextStyle: ThemeData.dark()
//               .textTheme
//               .titleLarge!
//               .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
//           iconTheme: ThemeData.dark().iconTheme,
//       color: AppColors.kPrimary1Dark,
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarBrightness: Brightness.dark,
//             statusBarIconBrightness: Brightness.dark,
//       ),
//     ),
//     textTheme: TextTheme(
//       titleLarge: TextStyle(
//         fontSize: 22.sp,
//         fontWeight: FontWeight.w600,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextWhite,
//       ),
//       titleMedium: TextStyle(
//         fontFamily: TTexts.kumbhSansFont,
//         fontSize: 15.sp,
//         fontWeight: FontWeight.w400,
//         color: AppColors.kTextGray,
//       ),
//       headlineSmall: TextStyle(
//         fontSize: 30.sp,
//         fontWeight: FontWeight.w600,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextWhite,
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w400,
//         fontFamily: TTexts.kumbhSansFont,
//         color: AppColors.kTextWhite,
//       ),
//     ),
//   );

}
