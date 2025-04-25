import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

import '../../../../src/components.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KTextBlack,

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                      height: 326.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/image_test.png'), // Replace with your image asset
                          fit: BoxFit
                              .fill, // Adjust as needed (e.g., BoxFit.cover, BoxFit.fill, etc.)
                        ),
                      )),
                ),
                SizedBox(height: 100.h,),
                Padding(padding: EdgeInsets.only(bottom: 20.h,),child: infoItem(),)
               ],
            ),
            headers(),
          ],
        ),
      ),
    );
  }

  Widget infoItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
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
              color: Colors.white,
            ),
          ),
          Text(
            'Had the perfect time today at North carolina. Thank you for coming out! Myself and the team appreciates your love and turnup. See you next week New York!',
            style: TextStyle(
                fontSize: 12.spMin,
                fontFamily: 'Campton',
                fontWeight: FontWeight.w400,
                color: Colors.white),
            // fontWeight: FontWeight.w400,
            // // maxLines: 3,
            // fontSize: 12.spMin,
          ),
        ],
      ),
    );
  }

  headers(){
    return  InkWell(
    onTap: () {
      navigateBack(context);

    },
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
          height: 30.h,
          child: Image.asset(
            AppAsset.backIcon,
            color: Colors.white,
          )),
    ),
    );
  }
}
