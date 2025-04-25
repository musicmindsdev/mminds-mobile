import 'package:flutter/material.dart';
import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/view/components/image_view.dart';
import 'package:music_minds/view/widgets/bottom_sheet/animated_bottom_sheet.dart';

// import 'bottom_sheet/animated_bottom_sheet.dart';

class MoreBottomSheet {
  void displayMoreOptionModalSheet(BuildContext context) {
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
          
                  return Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: const SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [MoreOptions()],
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

class MoreOptions extends StatefulWidget {
  const MoreOptions({
    super.key,
  });

  @override
  State<MoreOptions> createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: 'More',
                fontSize: 18.spMin,
                fontWeight: FontWeight.w600,
              ),

            ],
          ),
          SizedBox(
            height: 24.h,
          ),

        ],
      ),
    );
  }

  Widget moreItem({
    required final String icon,
    required final String title
}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.12)),
          borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.kPurple
                ),
                child: Center(child: ImageView.svg(icon, height: 17.h,),),
              ),
              SizedBox(
                width: 8.5.w,
              ),
              TextView(text: title)
            ],
          ),
        ],
      ),
    );
  }
}
