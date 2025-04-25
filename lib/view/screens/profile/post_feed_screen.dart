import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/utils/alerts.dart';
import 'package:music_minds/view/components/gradient_outlined_button.dart';

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({super.key});

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          headerWidget(),
          SizedBox(
            height: 28.h,
          ),
          userCard(),
          SizedBox(
            height: 28.h,
          ),
          textField(),
          SizedBox(
            height: 28.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                feedsSelectButton(
                    imagePath: AppAsset.musicPlaceHolderIcon, title: 'Music'),
                SizedBox(
                  width: 20.w,
                ),
                feedsSelectButton(
                    imagePath: AppAsset.imagePlaceHolderIcon, title: 'Photo'),
                SizedBox(
                  width: 20.w,
                ),
                feedsSelectButton(
                    imagePath: AppAsset.videoPlaceHolderIcon, title: 'Video'),
              ],
            ),
          )
        ],
      )),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
        child: submitButton(),
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

  userCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.0.w,
                height: 40.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // Background color of the circle
                  image: DecorationImage(
                    image: AssetImage(AppAsset
                        .notificationEnabled), // Replace with your profile image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Gilbert Wilson',
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  roleStatus(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  roleStatus() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.KFormfieldBlueFill),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAsset.locationIcon,
              color: AppColors.KBlue,
              height: 13.r,
            ),
            SizedBox(
              width: 3.6.w,
            ),
            TextView(
              text: 'My location',
              fontSize: 12.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.KBlue,
            ),
          ],
        ),
      ),
    );
  }

  textField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextFormField(
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'What’s new?',
          hintStyle: TextStyle(
              fontSize: 15.spMin,
              fontWeight: FontWeight.w500,
             fontFamily: TTexts.campTonFont,
              color: AppColors.KUserProfileNeutral),
        ),
      ),
    );
  }

  feedsSelectButton({
    required String imagePath,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        showBottomModalSheet(context, widget: feedListSelectImageOption());
      },
      child: Column(
        children: [
          GradientOutlineImageButton(
            strokeWidth: 1.w,
            radius: 8.r,
            width: 52.w,
            gradient: const LinearGradient(
              colors: [
                AppColors.KLinearGradient1,
                AppColors.KLinearGradient2,
                AppColors.KLinearGradient3,
              ],
            ),
            onPressed: () {
              showBottomModalSheet(context,
                  widget: feedListSelectImageOption());
            },
            child: Image.asset(
              imagePath,
              height: 28.4.h,
              width: 28.4.w,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextView(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 14.spMin,
          )
        ],
      ),
    );
  }

  submitButton() {
    return DefaultButtonMain(
      text: 'Post',
      buttonState: ButtonState.idle,
      onPressed: () {
        // navigatePush(context, VerifyEmailScreen());
      },
    );
  }

  feedListSelectImageOption() {
    return Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDrawerHandle(),
        SizedBox(height: 18.h,),
        listItem(
            ImageIconPath: AppAsset.takePictureIcon, title: 'Take picture', onTap: () { UtilFunctions.takePhoto(); }),
        listItem(
            ImageIconPath: AppAsset.galleryIcon,
            title: 'Choose existing picture', onTap: () { UtilFunctions.pickImage(); }),
        listItem(ImageIconPath: AppAsset.folderIcon, title: 'Choose from file', onTap: () {UtilFunctions.pickImage();  }),
      ],
    );
  }

  listItem({
    required String ImageIconPath,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      onTap: onTap,
      leading: Container(
        height: 33.4.h,
        width: 33.4.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.KFormfieldBlueBorder),
        child: Center(
          child: Image.asset(
            ImageIconPath,
            height: 18.4.h,
            width: 28.4.w,
          ),
        ),
      ),
      title: TextView(
        text: title,
        fontSize: 17.spMin,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  Widget _buildDrawerHandle() {
    return Container(
        width: 50.0.w,
        height: 4.0.h,
        decoration: BoxDecoration(
          color:AppColors.KNeutralFormFieldText,
          borderRadius: BorderRadius.circular(3.0),
        ));
  }
}
