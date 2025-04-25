import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_minds/config/app_colors.dart';

import 'animated_bottom_sheet.dart';

class AppointmentOptionBottomSheet {
  void displayAppointmentOptionModalSheet(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      // barrierColor: Colors.white,
      sheetAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 300)),
      builder: (BuildContext context) {
        return AnimatedBottomSheet(
          bottomSheetContent: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final width = MediaQuery.of(context).size.width;
                  final deviceHeight = MediaQuery.of(context).size.height;

                  double horizontalPadding =
                  screenSize.width < 600 ? 10.0 : 16.0;
                  double verticalPadding = screenSize.width < 600 ? 18.0 : 24.0;

                  double modalHeight = screenSize.height < 700
                      ? deviceHeight * 0.30
                      : deviceHeight * 0.30;
                  return Container(
                    width: double.maxFinite,
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom +
                            verticalPadding,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: width / 15,
                            ),
                            const AppointmentOption()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class AppointmentOption extends StatefulWidget {
  const AppointmentOption({super.key});

  @override
  State<AppointmentOption> createState() => _AppointmentOptionState();
}

class _AppointmentOptionState extends State<AppointmentOption> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
Text('Hello')
      ],
    );
  }
}
