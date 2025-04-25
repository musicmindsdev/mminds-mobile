import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/profile/availability_screens/always_open_screen.dart';
import 'package:music_minds/view/screens/profile/availability_screens/availability_critera_screen.dart';

import '../../../../src/components.dart';

class ScheduleAvailabilityScreen extends StatefulWidget {
  const ScheduleAvailabilityScreen({super.key});

  @override
  State<ScheduleAvailabilityScreen> createState() => _ScheduleAvailabilityScreenState();
}

class _ScheduleAvailabilityScreenState extends State<ScheduleAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: 10.h,
        ),
        headerWidget(),
          SizedBox(
            height: 20.h,
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: TextView(
            text: 'Availability',
            fontSize: 28.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
          SizedBox(
            height: 16.h,
          ),
          optionListWidget(title: 'Open for selected hours', onTap: () { navigatePush(context, AvailabilityCriteria()); }),
          optionListWidget(title: 'Always open', onTap: () { navigatePush(context, AlwaysOpenScreen()); })
      ],),),
    );
  }

  headerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: SizedBox(
                height: 30.h,
                child: Image.asset(
                  AppAsset.backIcon,
                )),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  optionListWidget(
  {
    required String title,
    required Function() onTap
}
      ){
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding:  EdgeInsets.symmetric(horizontal: 15.w),
          title: TextView(
            text: title,
            fontSize: 14.spMin,
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.keyboard_arrow_right, size: 24.r,),
        ),
        SizedBox(height: 10.w,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Divider(
            // endIndent: 28.0.w,
            color: AppColors.KDivider,
            height: 2.0.h,
          ),
        ),
      ],
    );
  }
}
