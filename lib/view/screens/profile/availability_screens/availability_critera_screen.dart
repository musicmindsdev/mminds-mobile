import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/profile/availability_screens/select_date_time.dart';

import '../../../../src/components.dart';

class AvailabilityCriteria extends StatefulWidget {
  const AvailabilityCriteria({super.key});

  @override
  State<AvailabilityCriteria> createState() => _AvailabilityCriteriaState();
}

class _AvailabilityCriteriaState extends State<AvailabilityCriteria> {
  List<String> daysOfTheWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              headerWidget(),
              SizedBox(
                height: 15.h,
              ),
              loadDaysOfWeek(),
              // SizedBox(
              //   height: 110.h,
              // ),
              // submitButton()
            ],
          ),
        ),
      ),
      bottomSheet: submitButton(),
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

  optionListWidget({required String title, required String subTitle , required Function() onTap}) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          title: TextView(
            text: title,
            fontSize: 18.spMin,
            fontWeight: FontWeight.w500,
          ),
          subtitle: TextView(
            text: subTitle,
            fontSize: 12.spMin,
            fontWeight: FontWeight.w400,
            color: AppColors.KNeutral,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 24.r,
          ),
        ),
        SizedBox(height: 2.h,),
        Divider(
          // endIndent: 28.0.w,
          color: AppColors.KDivider,
          height: 2.0.h,
        ),
      ],
    );
  }

  loadDaysOfWeek(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: daysOfTheWeek.length,
      itemBuilder: (context, index) {
        return optionListWidget(title:daysOfTheWeek[index], onTap: () { navigatePush(context, SelectDateTime());}, subTitle: '09:00 - 18:00');
      },
    );
  }

  submitButton() {
    return  Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 15.w ),
        child: DefaultButtonMain(
          text: 'Save',
          buttonState: ButtonState.idle,
          onPressed: (){

          },
        ),
      ),
    );
  }
}
