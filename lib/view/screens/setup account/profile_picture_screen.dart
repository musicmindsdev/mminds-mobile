import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/navigators.dart';
import 'package:music_minds/view/components/gradient_outlined_button.dart';
import 'package:music_minds/view/components/gradient_text.dart';
import 'package:music_minds/view/screens/setup%20account/account_setup_complete_screen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePictureScreen extends StatefulWidget {
  ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Process error:$e");
    }
  }

  void setupProfilePictureScreen(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: AppColors.kTransparent,
      context: ctx,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(
            top: 39.63.h,
            left: 20.86.w,
          ),
          width: double.infinity.w,
          height: 172.h,
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
          child: SizedBox(
            height: 91.76.h,
            width: 228.88.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: AppColors.KCircleAvatar,
                      child: Icon(
                        Icons.photo_camera,
                        size: 20.spMin,
                      ),
                    ),
                    const Gap(10.0),
                    TextView(
                      onTap: () => Navigator.of(context).pop(
                        pickImage(
                          ImageSource.camera,
                        ),
                      ),
                      text: "Take picture",
                      fontWeight: FontWeight.w400,
                      fontFamily: "Campton",
                      fontSize: 16.68.spMin,
                      color: AppColors.KBlack,
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.KCircleAvatar,
                        child: Icon(
                          Icons.image,
                          size: 20.spMin,
                        )),
                    const Gap(10.0),
                    TextView(
                      onTap: () => Navigator.of(context).pop(
                        pickImage(
                          ImageSource.gallery,
                        ),
                      ),
                      text: "Choose an existing picture",
                      fontWeight: FontWeight.w400,
                      fontFamily: "Campton",
                      fontSize: 16.68.spMin,
                      color: AppColors.KBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 30.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500.h,
                width: double.infinity.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                          text: "4/4",
                          percent: 4 / 4,
                        ),
                      ],
                    ),
                    const Gap(30),
                    SizedBox(
                      width: 200.w,
                      height: 61.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            maxLines: 1,
                            "Profile Picture",
                            style: TextStyle(
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w600,
                              fontSize: 28.spMin,
                              color: AppColors.KBlack,
                            ),
                          ),
                          Text(
                            "Setup your profile picture",
                            style: TextStyle(
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.spMin,
                              color: AppColors.KNeutralBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(70),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                     
                          CircleAvatar(
                            // backgroundImage: ,
                            backgroundColor: AppColors.KCircleAvatar,
                            radius: 60.r,
                            child: image == null
                                ? Icon(
                              Icons.person,
                              color: AppColors.KBlue,
                              fill: 1.0.h,
                              size: 118.spMin,
                                  )
                                : Image.file(image!),
                          ),
                          Positioned(
                            top: 75.h,
                            left: 97.w,
                            child: InkWell(
                              onTap: () {
                                setupProfilePictureScreen(context);
                              },
                              child: Container(
                                height: 32.h,
                                width: 33.29.w,
                                decoration: BoxDecoration(
                                  color: AppColors.KBlue,
                                  borderRadius: BorderRadius.circular(17.r),
                                  border: Border.all(
                                    color: AppColors.kWhite,
                                    width: 2.w,
                                  ),
                                ),
                                child: Icon(
                                  Icons.photo_camera,
                                  color: AppColors.kWhite,
                                  size: 22.spMin,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
                width: 349.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultButtonMain(
                      text: 'Create account',
                      onPressed: () {
                        navigatePush(context, AccountSetupComplete());
                      },
                    ),
                    GradientOutlineButton(
                        strokeWidth: 1.w,
                        radius: 8.r,
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
                          text: "Skip",
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Campton",
                          ),
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
