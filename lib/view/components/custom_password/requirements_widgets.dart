
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/providers.dart';
import 'package:music_minds/view_model/theme_view_model.dart';

class PassCheckRequirements extends ConsumerWidget {
  const PassCheckRequirements({super.key, this.passCheck, this.requirementText,
    this.activeIcon, this.inActiveIcon, this.inActiveColor, this.activeColor,});

  final bool? passCheck;
  final String? requirementText;
  final IconData? activeIcon;
  final IconData? inActiveIcon;
  final Color? inActiveColor;
  final Color? activeColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);

    return IntrinsicWidth( // Ensures minimal width is used
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h), // Add padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color:passCheck!? AppColors.kPrimary1: theme.colorScheme.secondary.withOpacity(0.2), width: 0.5.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Ensure the Row only takes necessary space
          children: [
            Icon(
              passCheck! ? Icons.check_circle_rounded : Icons.check_circle_outline_rounded,
              color: passCheck! ? AppColors.kPrimary1 : theme.colorScheme.secondary,
              size: 18.r,
            ),
            SizedBox(width: 2.5.w),
            Text(
              requirementText!,
              style: TextStyle(
                color: passCheck! ? theme.colorScheme.primary : theme.colorScheme.secondary,
                fontSize: 11.spMin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
