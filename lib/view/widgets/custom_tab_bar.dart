import 'package:music_minds/src/components.dart';
import 'package:music_minds/view/components/image_view.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final Color? dividerColor;
  final double? dividerHeight;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final double? indicatorWidth;
  final double? fontSize;
  final String? fontFamily;
  final String? iconPath;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.dividerColor,
    this.dividerHeight,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.indicatorWidth,
    this.fontSize,
    this.fontFamily, this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: dividerColor ?? AppColors.kPrimary1,
      dividerHeight: dividerHeight ?? 2.h,
      labelColor: labelColor ?? AppColors.kPrimary1,
      unselectedLabelColor: unselectedLabelColor ?? AppColors.kPrimary1,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize ?? 14.spMin,
        fontFamily: fontFamily ?? TTexts.campTonFont,
        color: labelColor ?? AppColors.kPrimary1,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize ?? 14.spMin,
        fontFamily: fontFamily ?? TTexts.campTonFont,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: indicatorColor ?? AppColors.kPrimary1,
          width: indicatorWidth ?? 2.0.w,
        ),
      ),
      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
    );
  }
}



class CustomIconTabBar extends StatefulWidget {
  final List<TabItem> tabs;
  final Color? dividerColor;
  final double? dividerHeight;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final double? indicatorWidth;
  final double? fontSize;
  final String? fontFamily;
   final  TabController tabController;

  const CustomIconTabBar({
    super.key,
    required this.tabs,
    this.dividerColor,
    this.dividerHeight,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.indicatorWidth,
    this.fontSize,
    this.fontFamily, required this.tabController,
  });

  @override
  State<CustomIconTabBar> createState() => _CustomIconTabBarState();
}

class _CustomIconTabBarState extends State<CustomIconTabBar> with SingleTickerProviderStateMixin {
  // late TabController _tabController;

  @override
  void dispose() {
    widget.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: widget.dividerColor ?? AppColors.kPrimary1,
      dividerHeight: widget.dividerHeight ?? 2.h,
      labelColor: widget.labelColor ?? AppColors.kPrimary1,
      unselectedLabelColor: widget.unselectedLabelColor ?? AppColors.kPrimary1,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: widget.fontSize ?? 14.spMin,
        fontFamily: widget.fontFamily ?? TTexts.campTonFont,
        color: widget.labelColor ?? AppColors.kPrimary1,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: widget.fontSize ?? 14.spMin,
        fontFamily: widget.fontFamily ?? TTexts.campTonFont,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: widget.indicatorColor ?? AppColors.kPrimary2,
          width: widget.indicatorWidth ?? 2.0.w,
        ),
      ),
      tabs: widget.tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        return _buildTab(tab, index);
      }).toList(),
    );
  }

  Widget _buildTab(TabItem tab, int index) {
    final isSelected = widget.tabController.index == index;
    final imageColor = isSelected
        ? (widget.indicatorColor ?? AppColors.kPurple)
        : (widget.unselectedLabelColor ?? AppColors.KPinkRating);

    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(imageColor, BlendMode.srcIn),
            child: ImageView.svg(
              tab.imagePath,
              width: 20.w,
              height: 20.h,
            ),
          ),
           SizedBox(width: 8.w),
          Text( tab.text),
        ],
      ),
    );
  }
}

class TabItem {
  final String text;
  final String imagePath;

  const TabItem({required this.text, required this.imagePath});
}