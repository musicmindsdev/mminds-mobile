import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:music_minds/view/components/country_flag.dart';
import 'package:music_minds/view/screens/setup%20account/user_genres_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:music_minds/view/components/gradient_outlined_button.dart';
import 'package:music_minds/view/components/gradient_text.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double rowHousingMinandMax = 262.w;
  List<CountryAndFlag> countriesNameAndFlag = [
    CountryAndFlag(
      countryFlag: AppAsset.americanFlag,
      countryName: "USA",
    ),
    CountryAndFlag(
      countryFlag: AppAsset.nigerianFlag,
      countryName: "Nigeria",
    ),
    CountryAndFlag(countryFlag: AppAsset.spainFlag, countryName: "Spain"),
    CountryAndFlag(countryFlag: AppAsset.koreanFlag, countryName: "Korea"),
    CountryAndFlag(countryFlag: AppAsset.japanFlag, countryName: "Japan"),
  ];
  String nameOfCountry = "USA";
  String countriesFlag = AppAsset.americanFlag;
  bool isChecked = false;
  bool isMaxTapped = false;
  bool isMinTapped = true;
  TextEditingController textEditingController = TextEditingController();
  String text = "";
  List musicians = [];
  Future<void> readMusicianJson() async {
    final String response = await rootBundle.loadString(AppAsset.musiciansJson);
    final data = await json.decode(response);
    setState(() {
      musicians = data["Musicians"];
    });
  }

  double minAndMaxWidth = 125.w;
  List filteredMusicians = [];

  List services = [];
  Future<void> readServicesJson() async {
    final String response = await rootBundle.loadString(AppAsset.servicesJson);
    final data = await json.decode(response);
    setState(() {
      services = data["Services"];
    });
  }

  // List<dynamic> getFilteredTexts() {

  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  void clearText() {
    setState(() {
      textEditingController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readServicesJson();
  }

  void runFilter(
    String text,
  ) {
    List result = [];
    if (text.isEmpty) {
      result = musicians;
    } else {
      result = musicians
          .where(
            (musician) => musician.toLowerCase().contains(
                  text.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      filteredMusicians = result;
    });
  }

  setupService(BuildContext ctx) {
    final theme = Theme.of(context);
    bool isMinTapped = false;
    bool isMaxTapped = false;
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.kTransparent,
      context: ctx,
      builder: (_) {
        return Container(
          width: MediaQuery.sizeOf(context).width.w,
          height: 750.h,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.8.r,
              ),
              topRight: Radius.circular(
                20.8.r,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0.w,
                  right: 20.0.w,
                  top: 40.h,
                ),
                child: SizedBox(
                  height: 20.h,
                  width: 349.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter by",
                        style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Campton",
                            color: AppColors.KBlack),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          size: 20.spMin,
                          color: AppColors.KBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              //
              DefaultDivider(
                color: AppColors.KBorderColor,
                width: MediaQuery.sizeOf(context).width.w,
                thickness: 1.2.w,
              ),
              const Gap(25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: SizedBox(
                  height: 651.h,
                  //CHECK LATER
                  width: MediaQuery.sizeOf(context).width.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Campton",
                          color: AppColors.KNeutralFormFieldText,
                        ),
                      ),
                      const Gap(10),
                      //
                      SizedBox(
                        width: 210.w,
                        height: 34.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GradientOutlineButton(
                                strokeWidth: 1.w,
                                radius: 4.r,
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.KLinearGradient1,
                                    AppColors.KLinearGradient2,
                                    AppColors.KLinearGradient3,
                                  ],
                                ),
                                child: GradientText(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.KLinearGradient1,
                                      AppColors.KLinearGradient2,
                                      AppColors.KLinearGradient3,
                                    ],
                                  ),
                                  text: "Nearby",
                                  style: TextStyle(
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Campton",
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Container(
                                height: 34.h,
                                width: 108.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.KBorderColor,
                                    width: 1.w,
                                  ),
                                  color: AppColors.kWhite,
                                  borderRadius: BorderRadius.circular(
                                    4.r,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Anywhere",
                                    style: TextStyle(
                                      color: AppColors.kPrimaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      fontFamily: "Campton",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      //
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width.w,
                        height: 1.0.h,
                        child: Divider(
                          color: AppColors.KDivider,
                          thickness: 0.50.w,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        "Price range",
                        style: TextStyle(
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Campton",
                          color: AppColors.KNeutralFormFieldText,
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        width: rowHousingMinandMax,
                        height: 46.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DefaultMaxMinButton(
                              onTap: () {
                                setState(() {
                                  isChecked == true;
                                  isMinTapped = true;
                                  isMaxTapped = false;
                                  minAndMaxWidth = 103.w;
                                  rowHousingMinandMax = MediaQuery.sizeOf(context).width.w;
                                });
                              },
                              width: minAndMaxWidth,
                              theme: theme,
                              hintText: "Min",
                            ),
                            const Gap(6),
                            DefaultMaxMinButton(
                              onTap: () {
                                setState(() {
                                  isChecked = true;
                                  isMinTapped = false;
                                  isMaxTapped = true;
                                  minAndMaxWidth = 103.w;
                                  rowHousingMinandMax = MediaQuery.sizeOf(context).width.w;
                                });
                              },
                              width: minAndMaxWidth,
                              theme: theme,
                              hintText: "Max",
                            ),
                            const Gap(6),
                            Visibility(
                              visible: isChecked,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.KBorderColor,
                                    width: 1.w,
                                  ),
                                  color: AppColors.KBorderFillColor,
                                  borderRadius: BorderRadius.circular(
                                    8.r,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                width: 119.w,
                                height: 48.h,
                                child: StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          radius: 10.r,
                                          backgroundImage: AssetImage(countriesFlag),
                                        ),
                                        DropdownButton<String>(
                                          underline: const SizedBox(),
                                          value: nameOfCountry,
                                          items: countriesNameAndFlag
                                              .map((country) => DropdownMenuItem<String>(
                                                    value: country.countryName,
                                                    child: TextView(
                                                      text: country.countryName,
                                                      fontSize: 14.spMin,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.KBlack,
                                                      fontFamily: "Campton",
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (newCountry) {
                                            setState(() {
                                              nameOfCountry = newCountry!;
                                              countriesFlag = countriesNameAndFlag
                                                  .firstWhere((country) =>
                                                      country.countryName == newCountry)
                                                  .countryFlag;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: AppColors.KBlack,
                                            size: 20.spMin,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Gap(10),
                      //
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width.w,
                        height: 1.0.h,
                        child: Divider(
                          color: AppColors.KDivider,
                          thickness: 0.50.w,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        "Service type",
                        style: TextStyle(
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Campton",
                          color: AppColors.KNeutralFormFieldText,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: services.length,
                          itemBuilder: ((context, index) => ListTile(
                              leading: Text(
                                services[index]["serviceType"],
                                style: TextStyle(
                                  fontFamily: "Campton",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.KBlack,
                                  fontSize: 14.spMin,
                                ),
                              ),
                              trailing: StatefulBuilder(
                                builder: (context, setState) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        services[index]["isChecked"] =
                                            !services[index]["isChecked"];
                                      });
                                    },
                                    child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        border: services[index]["isChecked"]
                                            ? null
                                            : Border.all(
                                                width: 2.0.w,
                                                color: AppColors.KNeutralFormFieldText,
                                              ),
                                        gradient: services[index]["isChecked"]
                                            ? AppColors.gradientMain
                                            : AppColors.transparentGradient,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      child: services[index]["isChecked"]
                                          ? Center(
                                              child: Icon(
                                              Icons.check,
                                              size: 20.spMin,
                                              color: AppColors.kWhite,
                                            ))
                                          : null,
                                    ),
                                  );
                                },
                              ))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.0.h),
            child: SizedBox(
              width: double.infinity.w,
              height: 60.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      navigateBack(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.KBlack,
                      size: 24.spMin,
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 270.w,
                    height: 35.36.h,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      cursorColor: AppColors.KBlack,
                      cursorWidth: 1.0.w,
                      cursorRadius: Radius.circular(0.7.r),
                      cursorHeight: 20.h,
                      controller: textEditingController,
                      onTap: () async {
                        await readMusicianJson();

                        filteredMusicians = musicians;
                      },
                      onChanged: (value) {
                        setState(() {
                          text = value;
                          runFilter(
                            text,
                          );
                        });
                      },
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Campton',
                        fontSize: 14.spMin,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.24.r),
                          borderSide: const BorderSide(
                            color: AppColors.KFormfieldBlueBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.24.r),
                          borderSide: BorderSide(
                            color: AppColors.KFormfieldBlueBorder,
                            width: 2.0.w,
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.KNeutralFormFieldText,
                          fontFamily: 'Campton',
                          fontSize: 14.spMin,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.24.r),
                            borderSide: const BorderSide(
                              color: AppColors.KBorderColor,
                            )),
                        fillColor: AppColors.KBorderFillColor,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25.0.spMin,
                          color: AppColors.KBlack,
                        ),
                        suffixIcon: Visibility(
                          visible: text.isNotEmpty,
                          child: InkWell(
                            onTap: () {
                              clearText();
                              setState(() {
                                text = "";
                              });
                              runFilter(text);
                            },
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              color: AppColors.kTransparent,
                              child: Image(
                                image: AssetImage(AppAsset.closeCircle),
                              ),
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  text.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            setupService(context);
                          },
                          child: Icon(
                            Icons.tune,
                            size: 25.spMin,
                            color: AppColors.KBlack,
                          ),
                        )
                      : TextView(
                          text: "Search",
                          color: AppColors.KBlue,
                          fontFamily: "Campton",
                          fontSize: 12.48.spMin,
                          fontWeight: FontWeight.w500,
                        )
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity.w,
            height: 2.0.h,
            child: Divider(
              color: AppColors.KBorderColor,
              thickness: 1.50.w,
            ),
          ),
          const Gap(10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: filteredMusicians.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 5.0.h,
                          right: 15.h,
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            width: 189.w,
                            height: 36.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: AssetImage(AppAsset.onboarding),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextView(
                                        text: filteredMusicians[index],
                                        color: AppColors.KBlack,
                                        fontFamily: "Campton",
                                        fontSize: 16.spMin,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Container(
                                        color: AppColors.kTransparent,
                                        width: 18.w,
                                        height: 18.h,
                                        child: Image(
                                          image: AssetImage(
                                            AppAsset.verifiedLogo,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          trailing: InkWell(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.KBlack,
                              size: 20.spMin,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class DefaultMaxMinButton extends StatelessWidget {
  DefaultMaxMinButton({
    super.key,
    required this.theme,
    required this.hintText,
    required this.width,
    required this.onTap,
  });
  ThemeData theme;
  final String hintText;
  double width;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15.h,
        left: 15.w,
      ),
      height: 46.h,
      // ignore: dead_code
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.KBorderColor,
          width: 1.w,
        ),
        color: AppColors.KBorderFillColor,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      child: TextFormField(
        onTap: onTap,
        autocorrect: false,
        enableSuggestions: false,
        cursorColor: AppColors.KBlack,
        keyboardType: TextInputType.number,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Campton',
          fontSize: 14.spMin,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.KNeutralFormFieldText,
            fontFamily: 'Campton',
            fontSize: 14.spMin,
          ),
        ),
      ),
      // child: Text(
      //   "Min",
      //   style: TextStyle(
      //     color: AppColors.KNeutralFormFieldText,
      //     fontWeight: FontWeight.w400,
      //     fontSize: 14.spMin,
      //     fontFamily: "Campton",
      //   ),
      // ),
    );
  }
}
