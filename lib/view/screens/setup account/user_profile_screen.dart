import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:music_minds/view/screens/setup%20account/user_genres_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

List<TextView> profileOptions = [
  TextView(
    fontFamily: "Campton",
    text: "Artist",
    fontWeight: FontWeight.w400,
    fontSize: 14.spMin,
    color: AppColors.KBlack,
  ),
  TextView(
    fontFamily: "Campton",
    text: "Teacher/Coach",
    fontWeight: FontWeight.w400,
    fontSize: 14.spMin,
    color: AppColors.KBlack,
  ),
  TextView(
    fontFamily: "Campton",
    text: "Agency Profile",
    fontWeight: FontWeight.w400,
    fontSize: 14.spMin,
    color: AppColors.KBlack,
  ),
  TextView(
    fontFamily: "Campton",
    text: "Studio Profile",
    fontWeight: FontWeight.w400,
    fontSize: 14.spMin,
    color: AppColors.KBlack,
  ),
  TextView(
    fontFamily: "Campton",
    text: "Fan",
    fontWeight: FontWeight.w400,
    fontSize: 14.spMin,
    color: AppColors.KBlack,
  ),
];

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? selectedValue;
  List typeOfArtist = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(AppAsset.userProfileJson);
    final data = await json.decode(response);
    setState(() {
      typeOfArtist = data["userprofile"]["artist"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  int value = 0;
  TextView currentOption = profileOptions[0];
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
              Column(
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
                          text: "1/4",
                          percent: 1 / 4,
                        )
                      ],
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    height: 52.h,
                    width: 300.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Setup profile",
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
                  const Gap(30),
                  SizedBox(
                    height: 400.h,
                    width: 349.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomExpansionTile(
                              leading: Text('Artist'),
                              trailing: Text('Expand Me'),
                              currentOption: currentOption,
                              radioValue: profileOptions[0],
                              children: SizedBox(
                                // height: 16.h,
                                child: Wrap(
                                  spacing: 3.0,
                                  children: List<Widget>.generate(
                                    typeOfArtist.length,
                                    (index) => ChoiceChip(
                                      onSelected: (value) {
                                        setState(() {
                                          typeOfArtist[index]["isSelected"] =
                                              !typeOfArtist[index]["isSelected"];
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
                                          color: typeOfArtist[index]["isSelected"]
                                              ? AppColors.KBlue
                                              : AppColors.kWhite,
                                          borderRadius: BorderRadius.circular(2.r),
                                        ),
                                        child: typeOfArtist[index]["isSelected"]
                                            ? const Icon(Icons.check)
                                            : const Icon(Icons.add),
                                      ),
                                      iconTheme: IconThemeData(
                                        size: 15.spMin,
                                        color: typeOfArtist[index]["isSelected"]
                                            ? AppColors.kWhite
                                            : AppColors.KBlue,
                                      ),
                                      label: Text(
                                        typeOfArtist[index]["userDetails"] ?? "genres",
                                      ),
                                      selected: value == index,
                                    ),
                                  ),
                                ),
                              )),
                          CustomExpansionTile(
                              leading: Text('Teacher/Coach'),
                              trailing: Text('Expand Me'),
                              currentOption: currentOption,
                              radioValue: profileOptions[1],
                              children: SizedBox(
                                // height: 16.h,
                                child: Wrap(
                                  spacing: 3.0,
                                  children: List<Widget>.generate(
                                    typeOfArtist.length,
                                    (index) => ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r),
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
                                        width: 9.w,
                                        height: 9.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.kWhite,
                                          borderRadius: BorderRadius.circular(0.2.r),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      iconTheme: IconThemeData(
                                        size: 10.spMin,
                                        color: AppColors.KBlue,
                                      ),
                                      label: Text(
                                        typeOfArtist[index]["userDetails"] ?? "Artist",
                                      ),
                                      selected: value == index,
                                    ),
                                  ),
                                ),
                              )),
                          CustomExpansionTile(
                              leading: Text('Agency Profile'),
                              trailing: Text('Expand Me'),
                              currentOption: currentOption,
                              radioValue: profileOptions[2],
                              children: SizedBox(
                                // height: 16.h,
                                child: Wrap(
                                  spacing: 3.0,
                                  children: List<Widget>.generate(
                                    typeOfArtist.length,
                                    (index) => ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r),
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
                                        width: 9.w,
                                        height: 9.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.kWhite,
                                          borderRadius: BorderRadius.circular(0.2.r),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      iconTheme: IconThemeData(
                                        size: 10.spMin,
                                        color: AppColors.KBlue,
                                      ),
                                      label: Text(
                                        typeOfArtist[index]["userDetails"] ?? "Artist",
                                      ),
                                      selected: value == index,
                                    ),
                                  ),
                                ),
                              )),
                          CustomExpansionTile(
                              leading: Text('Studio Profile'),
                              trailing: Text('Expand Me'),
                              currentOption: currentOption,
                              radioValue: profileOptions[3],
                              children: SizedBox(
                                // height: 16.h,
                                child: Wrap(
                                  spacing: 3.0,
                                  children: List<Widget>.generate(
                                    typeOfArtist.length,
                                    (index) => ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r),
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
                                        width: 9.w,
                                        height: 9.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.kWhite,
                                          borderRadius: BorderRadius.circular(0.2.r),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      iconTheme: IconThemeData(
                                        size: 10.spMin,
                                        color: AppColors.KBlue,
                                      ),
                                      label: Text(
                                        typeOfArtist[index]["userDetails"] ?? "Artist",
                                      ),
                                      selected: value == index,
                                    ),
                                  ),
                                ),
                              )),
                          CustomExpansionTile(
                              leading: Text('Fan'),
                              trailing: Text('Expand Me'),
                              currentOption: currentOption,
                              radioValue: profileOptions[4],
                              children: SizedBox(
                                // height: 16.h,
                                child: Wrap(
                                  spacing: 3.0,
                                  children: List<Widget>.generate(
                                    typeOfArtist.length,
                                    (index) => ChoiceChip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r),
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
                                        width: 9.w,
                                        height: 9.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.kWhite,
                                          borderRadius: BorderRadius.circular(0.2.r),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      iconTheme: IconThemeData(
                                        size: 10.spMin,
                                        color: AppColors.KBlue,
                                      ),
                                      label: Text(
                                        typeOfArtist[index]["userDetails"] ?? "Artist",
                                      ),
                                      selected: value == index,
                                    ),
                                  ),
                                ),
                              )),

                          /*Expanded(
                            child: SizedBox(
                              height: 190.0.h,
                              width: 349.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioListTile(
                                    title: TextView(
                                      fontFamily: "Campton",
                                      text: "Artist",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      color: AppColors.KBlack,
                                    ),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: profileOptions[0],
                                    groupValue: currentOption,
                                    onChanged: (value) {
                                      setState(() {
                                        currentOption = value as TextView;
                                      });
                                    },
                                  ),
                                  if (currentOption == profileOptions[0]) // Show ChoiceChips only when Artist is selected
                                    SizedBox(
                                      height: 16.h,
                                      child: Wrap(
                                        spacing: 3.0,
                                        children: List<Widget>.generate(
                                          typeOfArtist.length,
                                              (index) => ChoiceChip(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.r),
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
                                              width: 9.w,
                                              height: 9.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.kWhite,
                                                borderRadius: BorderRadius.circular(0.2.r),
                                              ),
                                              child: const Icon(Icons.add),
                                            ),
                                            iconTheme: IconThemeData(
                                              size: 10.spMin,
                                              color: AppColors.KBlue,
                                            ),
                                            label: Text(
                                              typeOfArtist[index].userDetails ?? "Artist",
                                            ),
                                            selected: value == index,
                                          ),
                                        ),
                                      ),
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
                          Expanded(
                            child: SizedBox(
                              height: 62.0.h,
                              width: double.infinity.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioListTile(
                                    title: TextView(
                                      fontFamily: "Campton",
                                      text: "Teacher/Coach",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      color: AppColors.KBlack,
                                    ),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: profileOptions[1],
                                    groupValue: currentOption,
                                    onChanged: (value) {
                                      setState(() {
                                        currentOption = value as TextView;
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
                          Expanded(
                            child: SizedBox(
                              height: 62.0.h,
                              width: 349.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioListTile(
                                    title: TextView(
                                      fontFamily: "Campton",
                                      text: "Agency Proflie",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      color: AppColors.KBlack,
                                    ),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: profileOptions[2],
                                    groupValue: currentOption,
                                    onChanged: (value) {
                                      setState(() {
                                        currentOption = value as TextView;
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
                          Expanded(
                            child: SizedBox(
                              height: 62.0.h,
                              width: 349.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioListTile(
                                    title: TextView(
                                      fontFamily: "Campton",
                                      text: "Studio Profile",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      color: AppColors.KBlack,
                                    ),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: profileOptions[3],
                                    groupValue: currentOption,
                                    onChanged: (value) {
                                      setState(() {
                                        currentOption = value as TextView;
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
                          Expanded(
                            child: SizedBox(
                              height: 62.0.h,
                              width: 349.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioListTile(
                                    title: TextView(
                                      fontFamily: "Campton",
                                      text: "Fan",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.spMin,
                                      color: AppColors.KBlack,
                                    ),
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    value: profileOptions[4],
                                    groupValue: currentOption,
                                    onChanged: (value) {
                                      setState(() {
                                        currentOption = value as TextView;
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
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: DefaultButtonMain(
                    text: 'Next',
                    onPressed: () {
                      navigatePush(context, UserGenresScreen());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  // final Widget title;
  final Widget leading;
  final Widget trailing;
  final Widget children;
  final bool initiallyExpanded;
  final Duration animationDuration;
  TextView currentOption;
  bool isRadioSelected;
  final dynamic radioValue;

  CustomExpansionTile(
      {Key? key,
      // required this.title,
      required this.leading,
      required this.trailing,
      required this.children,
      this.initiallyExpanded = false,
      this.animationDuration = const Duration(milliseconds: 100),
      required this.currentOption,
      required this.radioValue,
      this.isRadioSelected = false})
      : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _heightFactor = _controller?.drive(Tween(begin: 0.0, end: 1.0));
    if (_isExpanded) {
      _controller?.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller?.forward();
        widget.isRadioSelected = false;
      } else {
        _controller?.reverse();
        widget.isRadioSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            InkWell(
              onTap: _handleTap,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: widget.leading,
                      trailing: Radio(
                        groupValue: widget.isRadioSelected ? widget.radioValue : null,
                        onChanged: (value) {
                          setState(() {
                            widget.currentOption = value as TextView;
                          });
                        },
                        value: widget.radioValue,
                        // activeColor: widget.radioValue == null
                        //     ? Colors.grey // Customize the color for null value
                        //     : _isExpanded? Colors.blue:Colors.green,
                      )
                      // Icon(
                      //   _isExpanded ? Icons.expand_less : Icons.expand_more,
                      // ),
                      )),
            ),
            ClipRect(
              child: Align(
                heightFactor: _heightFactor?.value,
                child: widget.children,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 349.w,
          height: 1.h,
          child: Divider(
            endIndent: 28.0.w,
            color: AppColors.KDivider,
            height: 1.0.h,
          ),
        ),
      ],
    );
  }
}
