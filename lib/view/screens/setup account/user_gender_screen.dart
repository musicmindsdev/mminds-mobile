import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/navigators.dart';
import 'package:music_minds/view/components/radio_list_tile_objects.dart';

import 'package:music_minds/view/screens/setup%20account/account_setup_complete_screen.dart';
import 'package:music_minds/view/screens/setup%20account/profile_picture_screen.dart';
import 'package:music_minds/view/screens/setup%20account/user_genres_screen.dart';

class UserGenderScreen extends StatefulWidget {
  UserGenderScreen({Key? key}) : super(key: key);

  @override
  State<UserGenderScreen> createState() => _UserGenderScreenState();
}

List<RadioListTileObject> genderOptions = [
  RadioListTileObject(
    textObject: TextView(
      fontFamily: "Campton",
      text: "Male",
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: AppColors.KBlack,
    ),
    index: 0,
  ),
  RadioListTileObject(
    textObject: TextView(
      fontFamily: "Campton",
      text: "Female",
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: AppColors.KBlack,
    ),
    index: 1,
  ),
  RadioListTileObject(
    textObject: TextView(
      fontFamily: "Campton",
      text: "Other",
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: AppColors.KBlack,
    ),
    index: 2,
  ),
  RadioListTileObject(
    textObject: TextView(
      fontFamily: "Campton",
      text: "Prefer not to say",
      fontWeight: FontWeight.w400,
      fontSize: 14.spMin,
      color: AppColors.KBlack,
    ),
    index: 3,
  ),
];

class _UserGenderScreenState extends State<UserGenderScreen> {
  RadioListTileObject userGender = genderOptions[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0.w,
            vertical: 30.0.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //First child of the column
              SizedBox(
                height: 520.h,
                width: double.infinity.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateBack(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 28.spMin,
                              color: AppColors.KBlack,
                            ),
                          ),
                          CircularProfileProgressIndicator(
                            radius: 18.r,
                            lineWidth: 4.w,
                            text: "3/4",
                            percent: 3 / 4,
                          )
                        ],
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      width: 300.w,
                      height: 33.h,
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Choose your gender",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Campton",
                            fontSize: 28.spMin,
                            fontWeight: FontWeight.w600,
                            color: AppColors.KBlack,
                          ),
                        ),
                      ),
                    ),
                    const Gap(18),
                    SizedBox(
                      height: 250.h,
                      width: 349.w,
                      child: Column(
                        children: [
                          ...genderOptions.map(
                            (e) => Expanded(
                              child: SizedBox(
                                height: 35.0.h,
                                width: 349.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RadioListTile(
                                      title: e.textObject,
                                      controlAffinity: ListTileControlAffinity.trailing,
                                      value: genderOptions[e.index!],
                                      groupValue: userGender,
                                      onChanged: (value) {
                                        setState(() {
                                          userGender = value as RadioListTileObject;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 349.w,
                                      height: 1.h,
                                      child: Divider(
                                        endIndent: 28.0.w,
                                        color: AppColors.KDivider,
                                        height: 1.0.h,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child:
                DefaultButtonMain(text: 'Next',onPressed: (){
                  navigatePush(context, AccountSetupComplete());
                },)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
