import 'package:music_minds/src/components.dart';

showBottomModalSheet(BuildContext context, {
  required Widget widget
}){
  return showModalBottomSheet(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(21.r), topLeft: Radius.circular(21.r),)),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        // height: 227.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: widget
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     widget
        //   ],
        // ),
      );
    },
  );
}

showLocaleBottomModalSheet(BuildContext context, {
  required Widget widget
}){
  return showModalBottomSheet(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(21.r), topLeft: Radius.circular(21.r),)),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: 350.h,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: widget
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     widget
        //   ],
        // ),
      );
    },
  );
}

