import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/components/custom_tab_bar.dart';
import 'package:music_minds/view/components/gradient_outlined_button.dart';
import 'package:music_minds/view/components/gradient_text.dart';
import 'package:music_minds/view/screens/dashboard/home_screen/home_feed_screen.dart';
import 'package:music_minds/view/screens/profile/user_profile.dart';
import 'package:music_minds/view/screens/search%20and%20filter/search_and_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int initialIndex = 0;
  final List<Tab> tabs = [
    const Tab(text: 'Activity'),
    const Tab(text: 'Nearby'),
  ];

  late AnimationController _animationController;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: initialIndex,
        length: 2,
        child: Scaffold(
            appBar:
            AppBar(
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: Size(30, 20.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          navigatePush(context, const UserProfileScreen());
                        },
                        child: Container(
                          width: 36.0,
                          height: 36.0,
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
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 40.w, right: 40.w, bottom: 20.w),
                            child: CustomTabBar(
                              tabs: tabs,
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          navigatePush(context, SearchScreen());
                        },
                        child: Image.asset(
                          AppAsset.searchIcon,
                          width: 26.w,
                          height: 26.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: [
                            activityCard(),
                            activityCard(),
                            activityCard()
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(children: [
                                Image.asset(AppAsset.gpsPointerIcon, height: 20.h, width: 20.w,), SizedBox(width: 5.w,),
                                TextView(text: 'People nearby', fontWeight: FontWeight.w500, fontSize: 14.spMin,color: AppColors.KNeutralFormFieldText,)
                              ],),
                              SizedBox(height: 14.h,),
                              ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [nearbyCard(), nearbyCard(), nearbyCard()],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  activityCard() {
    return InkWell(
      onTap: (){
        navigatePush(context, HomeFeedScreen());
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
            color: AppColors.KFormfieldBlueFill,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                color: AppColors.KFormfieldBlueBorderFocused, width: 1.2.r)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading:
              Container(
                width: 28.0.w,
                height: 28.0.h,
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
              title: TextView(
                text: 'Gilbert Wilson',
                fontWeight: FontWeight.w500,
              ),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
            Container(
                height: 224.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/image_test.png'), // Replace with your image asset
                    fit: BoxFit
                        .fill, // Adjust as needed (e.g., BoxFit.cover, BoxFit.fill, etc.)
                  ),
                )),
            SizedBox(
              height: 12.h,
            ),
            TextView(
              text:
                  'Had the perfect time today at North carolina. Thank you for coming out! Myself and the team appreciates your love and turnup. See you next week New York!',
              fontWeight: FontWeight.w400,
              maxLines: 2,
              fontSize: 12.spMin,
            ),
          ],
        ),
      ),
    );
  }

  nearbyCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: AppColors.KFormfieldBlueFill,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: AppColors.KFormfieldBlueBorderFocused, width: 1.2.r)),
      child: Column(
        children: [
          ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 54.w,
                height: 54.h,
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
              title: TextView(
                text: 'Gilbert Wilson',
                fontSize: 18.spMin,
                fontWeight: FontWeight.w500,
              ),
              subtitle: TextView(
                text: 'Songwriter/Artist',
                fontWeight: FontWeight.w400,
                color: AppColors.KUserProfileNeutral,
                fontSize: 12.spMin,
              ),
              trailing: Container(
                width: 50.w,
                height: 23.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    color: AppColors.KPinkRating,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: '3.3/5',
                      color: AppColors.KPurpleRating,
                      fontSize: 10.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                    Center(
                        child: Image.asset(
                      AppAsset.starRatingIcon,
                      width: 9.40.w,
                      height: 9.40.h,
                    ))
                  ],
                ),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAsset.locationIcon,
                height: 12.h,
                width: 12.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              TextView(
                text: 'Winston-Salem, North Carolina',
                fontWeight: FontWeight.w400,
                maxLines: 1,
                fontSize: 12.spMin,
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAsset.musicPlayListIcon,
                height: 12.h,
                width: 12.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              TextView(
                text: 'Rap/Hip-Hop, R&B/Soul',
                fontWeight: FontWeight.w400,
                maxLines: 1,
                fontSize: 12.spMin,
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAsset.musicPlayListIcon,
                height: 12.h,
                width: 12.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: TextView(
                  text:
                      'American singer, songwriter, record producer, and on stage performer known for his versatile musical talents and dynamic stage presence.',
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                  fontSize: 12.spMin,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultButtonMain(
                  width: 142.w,
                  text: 'Book',
                  height: 44.h,
                  onPressed: () {
                    // navigatePush(context, const CreateAccountScreen());
                  }),
              SizedBox(
                width: 6.w,
              ),
              DefaultPinkButtonMain(
                width: 142.w,
                height: 45.h,
                text: 'Message',
                borderColor: AppColors.KBlue,
              ),
              Expanded(child: likeButton()),
              // likeButton()
            ],
          ),
        ],
      ),
    );
  }

  likeButton() {
    return GestureDetector(
      onTap: _toggleLike,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 28.r,
                color: isLiked ? Colors.red : Colors.black,
              ),
              Transform.scale(
                scale: _animationController.value,
                child: Icon(
                  Icons.favorite,
                  size: 28.r,
                  color: Colors.red,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
