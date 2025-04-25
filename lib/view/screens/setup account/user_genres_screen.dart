import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/navigators.dart';

import 'package:music_minds/view/screens/setup%20account/user_gender_screen.dart';

class UserGenresScreen extends StatefulWidget {
  UserGenresScreen({Key? key}) : super(key: key);

  @override
  State<UserGenresScreen> createState() => _UserGenresScreenState();
}

class _UserGenresScreenState extends State<UserGenresScreen> {
  int value = 0;
  List genres = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(AppAsset.userProfileJson);
    final data = await json.decode(response);
    setState(() {
      genres = data["useraccountdetails"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

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
              //First child of the main column
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
                            text: "2/4",
                            percent: 2 / 4,
                          )
                        ],
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      height: 55.h,
                      width: 300.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Genres",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: "Campton",
                                fontSize: 28.spMin,
                                fontWeight: FontWeight.w600,
                                color: AppColors.KBlack,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              maxLines: 1,
                              "Let others know what makes you unique!",
                              style: TextStyle(
                                fontFamily: "Campton",
                                fontWeight: FontWeight.w400,
                                fontSize: 14.spMin,
                                color: AppColors.KUserProfileNeutral,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(15),
                    SizedBox(
                      height: 372.h,
                      width: 333.w,
                      child: Wrap(
                        spacing: 3.0,
                        children: List<Widget>.generate(
                          genres.length,
                          (index) => ChoiceChip(
                            onSelected: (value) {
                              setState(() {
                                genres[index]["isSelected"] = !genres[index]["isSelected"];
                              });
                            },
                            showCheckmark: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4.r,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: "Campton",
                              color: AppColors.KBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.spMin,
                            ),
                            side: BorderSide(
                              color: AppColors.KBlue,
                              width: 1.w,
                            ),
                            backgroundColor: AppColors.KLightBlue,
                            avatar: Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                color: genres[index]["isSelected"]
                                    ? AppColors.KBlue
                                    : AppColors.kWhite,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: genres[index]["isSelected"]
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.add),
                            ),
                            iconTheme: IconThemeData(
                              size: 15.spMin,
                              color:
                                  genres[index]["isSelected"] ? AppColors.kWhite : AppColors.KBlue,
                            ),
                            label: Text(
                              genres[index]["userDetails"] ?? "genres",
                            ),
                            selected: value == index,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: DefaultButtonMain(
                  text: 'Next',
                  onPressed: () {
                    navigatePush(context, UserGenderScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
