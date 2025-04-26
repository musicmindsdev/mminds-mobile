import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/profile/availability_screens/schedule_availability_screen.dart';
import 'package:music_minds/view/screens/profile/post_feed_screen.dart';
import 'package:music_minds/view/screens/settings_and_notifications/settings_screen.dart';
import 'package:music_minds/view/widgets/custom_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  // final List<Tab> tabs = [
  //   const Tab(text: 'My Feeds'),
  //   const Tab(text: 'Schedule'),
  //   const Tab(text: 'Reviews'),
  // ];
  final List<String> tabs = [
    'My Feeds','Schedule','Reviews'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            headerWidget(),
            SizedBox(
              height: 28.h,
            ),
            notificationCard(),
            SizedBox(
              height: 28.h,
            ),
            tabBar(),
            Expanded(child: tabBarView())
          ],
        )),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: FloatingActionButton(
            onPressed: () {
              navigatePush(context, PostFeedScreen());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            backgroundColor: AppColors.KBlue,
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
          InkWell(
            onTap: () {
              navigatePush(context, SettingScreen());
            },
            child: SizedBox(
                height: 30.h, child: Image.asset(AppAsset.settingsIcon)),
          )
        ],
      ),
    );
  }

  notificationCard() {
    return Column(
      children: [
        Padding(
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
                      Row(
                        children: [
                          TextView(
                            text: '@gilbertwisdom',
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            color: AppColors.KUserProfileNeutral,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 6.r,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          roleStatus()
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextView(
                        text: 'No bio yet',
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w400,
                        color: AppColors.KUserProfileNeutral,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DefaultPinkButtonMain(
                        width: 290.w,
                        height: 45.h,
                        borderRadius: 4.r,
                        text: 'View bookings',
                        borderColor: AppColors.KBlue,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
        Divider(
          // endIndent: 28.0.w,
          color: AppColors.KDivider,
          height: 1.0.h,
        ),
      ],
    );
  }

  roleStatus() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.KFormfieldBlueFill),
        child: TextView(
          text: 'Songwriter',
          fontSize: 12.spMin,
          fontWeight: FontWeight.w500,
          color: AppColors.KBlue,
        ),
      ),
    );
  }

  tabBar() {
    return PreferredSize(
      preferredSize: Size(50, 20.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.w),
                  child: CustomTabBar(
                    tabs: tabs,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  tabBarView() {
    return TabBarView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
            Image.asset(
              AppAsset.leafScrollIcon,
              width: 120.w,
              height: 120.w,
            ),
            TextView(
              text: 'No feed to show yet',
              fontSize: 14.spMin,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
            Image.asset(
              AppAsset.scheduleImage,
              width: 120.w,
              height: 120.w,
            ),
            SizedBox(height: 8.h,),
            TextView(
              text: 'Let people know when you’re\navailable',
              textAlign: TextAlign.center,
              fontSize: 14.spMin,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 16.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 81.w),
              child: DefaultButtonMain(text: 'Setup availability schedule', onPressed: (){
                navigatePush(context, ScheduleAvailabilityScreen());
              },),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
            Image.asset(
              AppAsset.leafScrollIcon,
              width: 120.w,
              height: 120.w,
            ),
            TextView(
              text: 'No reviews to show yet',
              fontSize: 14.spMin,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}

class StarRating extends StatefulWidget {
  final double rating;
  final ValueChanged<double> onRatingChanged;

  StarRating({required this.rating, required this.onRatingChanged});

  @override
  _StarRatingState createState() => _StarRatingState();
}
class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        bool isSelected = index < widget.rating;
        return IconButton(
          icon: isSelected ? Icon(Icons.star, color: Colors.amber) : Icon(Icons.star_border),
          onPressed: () {
            // When a star is pressed, update the rating
            widget.onRatingChanged(index + 1.0);
          },
        );
      }),
    );
  }
}
