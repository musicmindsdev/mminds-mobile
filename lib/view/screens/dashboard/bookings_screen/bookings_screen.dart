import 'package:music_minds/config/app_assets.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/dashboard/bookings_screen/bookings_details.dart';
import 'package:music_minds/view/widgets/custom_tab_bar.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  // final List<Tab> tabs = [
  //   const Tab(text: 'Confirmed'),
  //   const Tab(text: 'Pending'),
  //   const Tab(text: 'History'),
  // ];

  final List<String> tabs = [
   'Confirmed','Pending','History'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size(50, 20.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 20.w),
                          child: CustomTabBar(
                            tabs: tabs,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
            TabBarView(
              children: [
                ListView(
                  children: [nearbyCard(), nearbyCard()],
                ),
                ListView(
                  children: [nearbyCard(), nearbyCard()],
                ),
                ListView(
                  children: [nearbyCard(), nearbyCard()],
                )
              ],
            ),
          ),
        ));
  }

  nearbyCard() {
    return InkWell(
      onTap: (){
        navigatePush(context,  BookingDetailsScreen());
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        TextView(
                          text: 'WED',
                          fontSize: 10.spMin,
                          fontWeight: FontWeight.w600,
                          color: AppColors.KBlue,
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        TextView(
                          text: '06',
                          fontSize: 26.spMin,
                          fontWeight: FontWeight.w400,
                          color: AppColors.KBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Container(
                      width: 2.0, // Width of the vertical divider
                      height: 86.h,
                      color: AppColors
                          .KFormfieldBlueBorder, // Color of the vertical divider
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: TextView(
                            text: 'Voice Coach Lesson with gilmore',
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAsset.clockIcon,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            TextView(
                              text: '09:00 - 12:30',
                              fontWeight: FontWeight.w400,
                              maxLines: 1,
                              fontSize: 12.spMin,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
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
                              text: 'Honolulu, Hawaii, U.S',
                              fontWeight: FontWeight.w400,
                              maxLines: 1,
                              fontSize: 12.spMin,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            TextView(
              text:
                  'American singer, songwriter, record producer, and on stage performer known for his versatile musical talents and dynamic stage presence.',
              fontWeight: FontWeight.w400,
              maxLines: 2,
              fontSize: 12.spMin,
            ),
          ],
        ),
      ),
    );
  }
}
