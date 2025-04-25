import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              TextView(
                text: 'TODAY',
                fontSize: 12.spMin,
                fontWeight: FontWeight.w400,
              ),
              // notificationCards(),
              SizedBox(
                height: 16.w,
              ),
              notificationCard(),
              // noNotificationItem()
            ],
          ),
        ),
      ),
    );
  }

  notificationCard() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: 261.w,
                      child: TextView(
                        text:
                            'Gilbert Wilson  confirmed booking request, continue to make payment',
                        maxLines: 2,
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DefaultPinkButtonMain(
                      width: 135.w,
                      height: 45.h,
                      borderRadius: 4.r,
                      text: 'View bookings',
                      borderColor: AppColors.KBlue,
                    )
                  ],
                )
              ],
            ),
            TextView(
              text: '1:00 AM',
              fontSize: 10.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.KUserProfileNeutral,
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Divider(
          // endIndent: 28.0.w,
          color: AppColors.KDivider,
          height: 1.0.h,
        ),
      ],
    );
  }

  noNotificationItem() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 14.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.KFormfieldBlueFill),
        child: TextView(
          text: 'You have no new notification',
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.KUserProfileNeutral,
        ),
      ),
    );
  }
}
