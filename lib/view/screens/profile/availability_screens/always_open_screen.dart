import 'package:flutter/cupertino.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

import '../../../../src/components.dart';

class AlwaysOpenScreen extends StatefulWidget {
  const AlwaysOpenScreen({super.key});

  @override
  State<AlwaysOpenScreen> createState() => _AlwaysOpenScreenState();
}

class _AlwaysOpenScreenState extends State<AlwaysOpenScreen> {
  List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  // bool switchValue = false; // Initial value is set to 'false'
  List<bool>? switchValues;
  bool isSwitched = false;
  void toggleSwitch(int index) {
    setState(() {
      switchValues![index] = !switchValues![index];
    });
  }

  @override
  Widget build(BuildContext context) {
    switchValues = List.generate(daysOfTheWeek.length, (index) => false);
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
              SizedBox(
                height: 110.h,
              ),
              submitButton()
            ],
          ),
        ),
      ),
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
      {required String title,
      required String subTitle,
      required Function() onTap,
      required int index}) {
    return Column(
      children: [
        ListTile(
            onTap: () {
              setState(() {
                isSwitched =! isSwitched;
              });
            },
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

            trailing:
            CupertinoSwitch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            )),
        SizedBox(
          height: 2.h,
        ),
        Divider(
          // endIndent: 28.0.w,
          color: AppColors.KDivider,
          height: 2.0.h,
        ),
      ],
    );
  }

  loadDaysOfWeek() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: daysOfTheWeek.length,
      itemBuilder: (context, index) {
        return optionListWidget(
            title: daysOfTheWeek[index],
            onTap: () {},
            subTitle: 'Always open',
            index: index);
      },
    );
  }

  submitButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: DefaultButtonMain(
          text: 'Save',
          buttonState: ButtonState.idle,
          onPressed: () {},
        ),
      ),
    );
  }
  // ListTile(
  // title: Text('Enable Feature'),
  // trailing: CupertinoSwitch(
  // value: true, // You can set the initial value here
  // onChanged: (bool value) {
  // // Handle the switch value change
  // },
  // ),
}
