import 'package:flutter/cupertino.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

import '../../../../src/screens.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime({super.key});

  @override
  State<SelectDateTime> createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  TimeOfDay ?startTime;
  TimeOfDay ?endTime;
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay ?picked = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        endTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            headerWidget(),
            SizedBox(
              height: 15.h,
            ),
            optionListWidget(title: 'From', onTap: () => _selectStartTime(context), leadingText: '${startTime?.format(context) ??"0:00"}'),
            optionListWidget(title: 'To', onTap: () => _selectEndTime(context), leadingText: '${endTime?.format(context) ??"0:00"}'),
            // CupertinoListTile(
            //   leading: Icon(CupertinoIcons.person),
            //   title: Text('John Doe'),
            //   subtitle: Text('johndoe@example.com'),
            //   onTap: () {
            //     // Handle onTap event here
            //   },
            // ),
          ],
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

  submitButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: DefaultButtonMain(
          text: 'Save',
          onPressed: () {

          },
        ),
      ),
    );
  }

  optionListWidget(
      {required String title,
      required String leadingText,
      required Function() onTap}) {
    return Column(
      children: [
        ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
            title: TextView(
              text: title,
              fontSize: 14.spMin,
              fontWeight: FontWeight.w400,
            ),
            trailing: InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.6.r),
                    color: AppColors.KUserProfileNeutral.withOpacity(0.1)),
                child: TextView(
                  text: leadingText,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
        SizedBox(
          height: 10.w,
        ),
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


