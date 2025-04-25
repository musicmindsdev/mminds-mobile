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

class BookScreen extends StatefulWidget {
  BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool isClicked = false;
  List<CountryAndFlag> countriesNameAndFlag = [
    CountryAndFlag(
      countryFlag: AppAsset.americanFlag,
      countryName: "USA",
      stateAndCities: [
        StateAndCities(
          state: "Vermont",
          city: ["Burlington", "Montepelier"],
        ),
        StateAndCities(
          state: "Hawaii",
          city: ["Lahaina", "Honolulu"],
        ),
      ],
    ),
    CountryAndFlag(
      countryFlag: AppAsset.nigerianFlag,
      countryName: "Nigeria",
      stateAndCities: [
        StateAndCities(
          state: "Rivers",
          city: ["Port_HarCourt", "Ahoda"],
        ),
      ],
    ),
    CountryAndFlag(countryFlag: AppAsset.spainFlag, countryName: "Spain"),
    CountryAndFlag(countryFlag: AppAsset.koreanFlag, countryName: "Korea"),
    CountryAndFlag(countryFlag: AppAsset.japanFlag, countryName: "Japan"),
  ];

  // Future<void> readBookingsCountryJson() async {
  //   final String response = await rootBundle.loadString(AppAsset.bookingsJson);
  //   final data = await json.decode(response);
  //   setState(() {
  //     countriesNameAndFlag = data["Bookings"]["Country"];
  //   });
  // }

  // Future<void> readBookingsCountryLocationJson() async {
  //   final String response = await rootBundle.loadString(AppAsset.bookingsJson);
  //   final data = await json.decode(response);
  //   setState(() {
  //     countryStateAndCity = data["Bookings"]["Location"];
  //   });
  // }

  ThemeData theme = ThemeData();
  // @override
  // void initState() {
  //   super.initState();
  //   readBookingsCountryLocationJson();
  //   readBookingsCountryJson();
  //   nameOfCountry = countriesNameAndFlag.first;
  //   // countriesFlag = countriesNameAndFlag.first["flag"];
  // }

  String nameOfCountry = "USA";
  String countriesFlag = AppAsset.americanFlag;
  String nameOfState = "";
  String nameOfCity = "";
  String locationCountry = "";
  DateTime dateTime = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  void _showDatePicker() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) => setState(
          () {
            dateTime = value!;
          },
        ));
  }

  Future<void> _selectedTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: selectedTime);
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String formattedDate(DateTime date) {
    String formattedDate = DateFormat('d MMM y').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String formatDate = formattedDate(dateTime);
    String formattedTime =
        '${selectedTime.hourOfPeriod}:${selectedTime.minute.toString().padLeft(2, '0')}';
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
                child: DefaultBackButton(
                  onTap: () {},
                ),
              ),
              const Gap(15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width.w,
                  height: 44.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 44.w,
                        height: 44.h,
                        child: Image(
                          image: AssetImage(
                            AppAsset.profilePicture,
                          ),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 44.h,
                        width: 220.09.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextView(
                                text: "Gilbert Wilson",
                                color: AppColors.KBlack,
                                fontSize: 20.spMin,
                                fontWeight: FontWeight.w500,
                                fontFamily: TTexts.campTonFont,
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                              width: 178.09.w,
                              child: Row(
                                children: [
                                  TextView(
                                    text: "@gilbertwisdom",
                                    color: AppColors.KNeutralFormFieldText,
                                    fontSize: 12.spMin,
                                    fontFamily:  TTexts.campTonFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const Gap(5),
                                  CircleAvatar(
                                    backgroundColor: AppColors.KBlack,
                                    radius: 1.5.r,
                                  ),
                                  const Gap(5),
                                  Container(
                                    width: 68.w,
                                    height: 14.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.KLightBlue,
                                      borderRadius: BorderRadius.circular(
                                        4.r,
                                      ),
                                    ),
                                    child: TextView(
                                      text: "Songwriter",
                                      fontSize: 12.spMin,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:  TTexts.campTonFont,
                                      color: AppColors.KBlue,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.topRight,
                        child: DefaultRatingButton(
                          text: '3.3/5',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(15),
              DefaultDivider(
                width: double.infinity.w,
                color: AppColors.KDivider,
                thickness: 1.w,
              ),
              const Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: SizedBox(
                  width: 321.w,
                  height: 108.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: "Select service",
                        color: AppColors.KCircleNeutralColor,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily:  TTexts.campTonFont,
                      ),
                      SizedBox(
                        height: 88.h,
                        width: 321.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientOutlineButton(
                                  height: 38.h,
                                  width: 133.w,
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
                                    text: "Vocal coach",
                                    style: TextStyle(
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:  TTexts.campTonFont,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                DefaultTextButton(
                                  width: 178.w,
                                  height: 38.w,
                                  radius: 4.r,
                                  onTap: () {},
                                  text: "Instrumental coach",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 290.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultTextButton(
                                    width: 193.w,
                                    height: 38.w,
                                    // padding: EdgeInsets.only(
                                    //   left: 14.w,
                                    //   top: 27.h,
                                    //   right: 14.w,
                                    //   bottom: 27.h,
                                    // ),
                                    radius: 4.r,
                                    onTap: () {},
                                    text: "Music business coach",
                                  ),
                                  DefaultTextButton(
                                    width: 92.w,
                                    height: 38.w,
                                    radius: 4.r,
                                    onTap: () {},
                                    text: "Other",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: SizedBox(
                  width: 315.w,
                  height: 86.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: "Budget",
                        color: AppColors.KCircleNeutralColor,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily:  TTexts.campTonFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultTextField(
                            textInputType: TextInputType.number,
                            theme: theme,
                            width: 184.w,
                            height: 48.h,
                            radius: 4.r,
                            hintText: "What is your budget",
                          ),
                          Container(
                            width: 119.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: AppColors.KBorderFillColor,
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: AppColors.KBorderColor,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: SizedBox(
                                width: 70.w,
                                child: Row(
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
                                                  fontFamily:  TTexts.campTonFont,
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (newCountry) {
                                        setState(() {
                                          nameOfCountry = newCountry!;
                                          countriesFlag = countriesNameAndFlag
                                              .firstWhere(
                                                  (country) => country.countryName == newCountry)
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
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Gilbert Wilson's minimum budget is ",
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            fontFamily:  TTexts.campTonFont,
                            color: AppColors.KNeutral,
                          ),
                          children: [
                            TextSpan(
                                text: "500.00 USD",
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  fontFamily:  TTexts.campTonFont,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.KUserProfileNeutral,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: SizedBox(
                  width: 229.w,
                  height: 58.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: "Start date & time",
                        color: AppColors.KCircleNeutralColor,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily:  TTexts.campTonFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultDateAndTimeButton(
                            onTap: () {
                              _showDatePicker();
                            },
                            width: 147.w,
                            height: 34.w,
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              size: 20.spMin,
                              color: AppColors.KBlack,
                            ),
                            text: formatDate,
                          ),
                          DefaultDateAndTimeButton(
                            onTap: () {
                              _selectedTime(context);
                            },
                            text: formattedTime,
                            height: 34.h,
                            width: 76.h,
                            icon: Icon(
                              Icons.schedule,
                              size: 20.spMin,
                              color: AppColors.KBlack,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: SizedBox(
                  width: 229.w,
                  height: 58.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: "Finish date & time",
                        color: AppColors.KCircleNeutralColor,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily:  TTexts.campTonFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultDateAndTimeButton(
                            onTap: () {
                              _showDatePicker();
                            },
                            width: 147.w,
                            height: 34.w,
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              size: 20.spMin,
                              color: AppColors.KBlack,
                            ),
                            text: formatDate,
                          ),
                          DefaultDateAndTimeButton(
                            onTap: () {
                              _selectedTime(context);
                            },
                            text: formattedTime,
                            height: 34.h,
                            width: 76.h,
                            icon: Icon(
                              Icons.schedule,
                              size: 20.spMin,
                              color: AppColors.KBlack,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: DefaultDivider(
                  width: double.infinity.w,
                  color: AppColors.KDivider,
                  thickness: 1.w,
                ),
              ),
              const Gap(40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  width: 350.w,
                  height: 193.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: "Location",
                            color: AppColors.KCircleNeutralColor,
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                            fontFamily:  TTexts.campTonFont,
                          ),
                          SizedBox(
                            width: 72.w,
                            height: 18.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 18.w,
                                  height: 18.h,
                                  child: Image(
                                    image: AssetImage(
                                      AppAsset.map,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: TextView(
                                    text: "Use map",
                                    color: AppColors.KCircleNeutralColor,
                                    fontSize: 12.spMin,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:  TTexts.campTonFont,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Gap(15),
                      SizedBox(
                        height: 46.h,
                        width: 350.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultCountryStateCityButton(
                                dropDown: DropdownButton<String>(
                              value: locationCountry.isEmpty ? null : locationCountry,
                              underline: const SizedBox(),
                              hint: TextView(
                                text: "Country",
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                                color: AppColors.KNeutralFormFieldText,
                                fontFamily:  TTexts.campTonFont,
                              ),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.KBlack,
                                size: 20.spMin,
                              ),
                              items: countriesNameAndFlag
                                  .map((country) => DropdownMenuItem<String>(
                                        value: country.countryName,
                                        child: TextView(
                                          text: country.countryName,
                                          fontSize: 14.spMin,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.KBlack,
                                          fontFamily:  TTexts.campTonFont,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (newCountry) {
                                setState(() {
                                  locationCountry = newCountry!;
                                  nameOfState = "";
                                  nameOfCity = "";
                                });
                              },
                            )),
                            DefaultCountryStateCityButton(
                                dropDown: DropdownButton<String>(
                              value: nameOfState.isEmpty ? null : nameOfState,
                              underline: const SizedBox(),
                              hint: TextView(
                                text: "State",
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                                color: AppColors.KNeutralFormFieldText,
                                fontFamily:  TTexts.campTonFont,
                              ),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.KBlack,
                                size: 20.spMin,
                              ),
                              items: locationCountry.isEmpty
                                  ? []
                                  : countriesNameAndFlag
                                      .firstWhere(
                                          (country) => country.countryName == locationCountry)
                                      .stateAndCities!
                                      .map((state) => DropdownMenuItem(
                                            value: state.state,
                                            child: TextView(
                                              text: state.state,
                                              fontFamily:  TTexts.campTonFont,
                                              fontSize: 15.spMin,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))
                                      .toList(),
                              onChanged: (newState) {
                                setState(() {
                                  nameOfState = newState!;
                                  nameOfCity = "";
                                });
                              },
                            )),
                          ],
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 46.h,
                        width: 350.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultCountryStateCityButton(
                                dropDown: DropdownButton<String>(
                              value: nameOfCity.isEmpty ? null : nameOfCity,
                              underline: const SizedBox(),
                              hint: TextView(
                                text: "City",
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                                color: AppColors.KNeutralFormFieldText,
                                fontFamily:  TTexts.campTonFont,
                              ),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.KBlack,
                                size: 20.spMin,
                              ),
                              items: nameOfState.isEmpty
                                  ? []
                                  : countriesNameAndFlag
                                      .firstWhere(
                                          (country) => country.countryName == locationCountry)
                                      .stateAndCities!
                                      .firstWhere((state) => state.state == nameOfState)
                                      .city
                                      .map((city) => DropdownMenuItem(
                                            value: city,
                                            child: TextView(
                                              text: city,
                                              fontFamily:  TTexts.campTonFont,
                                              fontSize: 15.spMin,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))
                                      .toList(),
                              onChanged: (newCity) {
                                setState(() {
                                  nameOfCity = newCity!;
                                });
                              },
                            )),
                            DefaultTextField(
                              textInputType: TextInputType.number,
                              theme: theme,
                              height: 46.h,
                              width: 171.w,
                              radius: 8.r,
                              hintText: "Zip code",
                            )
                          ],
                        ),
                      ),
                      const Gap(10),
                      DefaultTextField(
                        textInputType: TextInputType.text,
                        theme: theme,
                        height: 46.h,
                        width: 349.w,
                        radius: 8.r,
                        hintText: "Enter venue address",
                      )
                    ],
                  ),
                ),
              ),
              const Gap(40),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: SizedBox(
                  width: 350.w,
                  height: 119.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: "Description",
                        color: AppColors.KCircleNeutralColor,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily:  TTexts.campTonFont,
                      ),
                      DefaultTextField(
                        textInputType: TextInputType.text,
                        theme: theme,
                        height: 85.h,
                        width: 350.w,
                        radius: 10.7.r,
                        hintText: "Write a message...",
                      )
                    ],
                  ),
                ),
              ),
              const Gap(0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: DefaultButtonMain(
                      text: "Book",
                      onPressed: () {},
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.theme,
    required this.height,
    required this.width,
    required this.radius,
    required this.hintText,
    required this.textInputType,
  });

  final ThemeData theme;
  final double width;
  final double height;
  final double radius;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        cursorColor: AppColors.KBlack,
        cursorWidth: 1.0.w,
        cursorRadius: Radius.circular(0.7.r),
        cursorHeight: 20.h,
        onChanged: (value) {},
        keyboardType: textInputType,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.w400,
         fontFamily: TTexts.campTonFont,
          fontSize: 14.spMin,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: const BorderSide(
                color: AppColors.KBorderColor,
              )),
          fillColor: AppColors.KBorderFillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: AppColors.KFormfieldBlueBorder,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: AppColors.KFormfieldBlueBorder,
              width: 2.0.w,
            ),
          ),
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.KNeutralFormFieldText,
           fontFamily: TTexts.campTonFont,
            fontSize: 14.spMin,
          ),
        ),
      ),
    );
  }
}

class DefaultCountryStateCityButton extends StatelessWidget {
  const DefaultCountryStateCityButton({super.key, required this.dropDown});

  final Widget dropDown;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: AppColors.KBorderFillColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.KBorderColor,
        ),
      ),
      child: SizedBox(
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: dropDown,
              )
              // TextView(
              //   text: text,
              // color: AppColors.KNeutralFormFieldText,
              // fontSize: 14.spMin,
              // fontWeight: FontWeight.w400,
              // fontFamily:  TTexts.campTonFont,
              // ),
              // SizedBox(
              //   width: 18.w,
              //   height: 18.h,
              //   child: dropDown,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

// class DefaultZipCodeButton extends StatelessWidget {
//   const DefaultZipCodeButton({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 171.w,
//       height: 46.h,
//       decoration: BoxDecoration(
//         color: AppColors.KBorderFillColor,
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(
//           color: AppColors.KBorderColor,
//         ),
//       ),
//       child: SizedBox(
//         width: 100.w,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [

//               TextView(
//                 text: text,
//                 color: AppColors.KNeutralFormFieldText,
//                 fontSize: 14.spMin,
//                 fontWeight: FontWeight.w400,
//                 fontFamily:  TTexts.campTonFont,
//               ),
//               // SizedBox(
//               //   width: 18.w,
//               //   height: 18.h,
//               //   child: dropDown,
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DefaultDateAndTimeButton extends StatelessWidget {
  const DefaultDateAndTimeButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.icon,
    required this.onTap,
  });
  final double width;
  final double height;
  final Widget icon;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.6.r),
          color: AppColors.KTimeAndDate,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                InkWell(
                  onTap: onTap,
                  child: icon,
                ),
                TextView(
                  text: text,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                  fontFamily:  TTexts.campTonFont,
                  color: AppColors.KBlack,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
