import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/view/components/image_view.dart';
import 'package:music_minds/view_model/dashboard/dashboard_view_model.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final int? currentIndex;
  const DashboardScreen({super.key, this.currentIndex});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with SingleTickerProviderStateMixin {
  @override
  void didChangeDependencies() async {
    Future.microtask(() async {
      await ref
          .read(dashboardViewModel)
          .setPageIndex(selectedPageIndex: widget.currentIndex ?? 0);
    });
    super.didChangeDependencies();
  }

  List<Widget> dashboardPages = [
    const HomeScreen(),
    const MessageScreen(),
    const BookingsScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var dashProvider = ref.watch(dashboardViewModel);
    return Scaffold(
      body: dashboardPages[dashProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageView.asset(
              dashProvider.currentIndex == 0
                  ? AppAsset.homeEnabled
                  : AppAsset.homeDisabled,
              height: 24.h,
              width: 24.w,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              dashProvider.currentIndex == 1
                  ? AppAsset.smsEnabled
                  : AppAsset.smsDisabled,
              height: 24.h,
              width: 24.w,
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              dashProvider.currentIndex == 2
                  ? AppAsset.bookingsEnabled
                  : AppAsset.bookingsDisabled,
              height: 24.h,
              width: 24.w,
            ),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              dashProvider.currentIndex == 3
                  ? AppAsset.notificationEnabled
                  : AppAsset.notificationDisabled,
              height: 24.h,
              width: 24.w,
            ),
            label: "Notification",
          ),
        ],
        unselectedItemColor: AppColors.KNeutral,
        selectedItemColor: null,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12.spMin,
          fontFamily: TTexts.campTonFont,
          fontWeight: FontWeight.w600,
        ),
        unselectedFontSize: 12.spMin,
        unselectedLabelStyle: TextStyle(
          fontSize: 12.spMin,
          fontFamily: TTexts.campTonFont,
          fontWeight: FontWeight.w500,
        ),
        currentIndex: dashProvider.currentIndex,
        onTap: (index) {
          dashProvider.setPageIndex(selectedPageIndex: index);
        },
      ),
    );
  }
}
