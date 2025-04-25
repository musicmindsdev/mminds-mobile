import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/widgets/custom_alert_dialogs/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class JoinCallAlertDialog extends CustomAlertDialog {
  JoinCallAlertDialog(
      List<Widget> additionalWidgets, Color? backgroundColor)
      : super([
    ...additionalWidgets,
  ], backgroundColor);

}

void showJoinCallDialog(BuildContext context) {
  JoinCallAlertDialog([const JoinCallDetails()], null)
      .showCustomDialog(context);
}


class JoinCallDetails extends StatefulWidget {
  const JoinCallDetails({super.key});

  @override
  State<JoinCallDetails> createState() => _JoinCallDetailsState();
}

class _JoinCallDetailsState extends State<JoinCallDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: 70.h,
          ),
          DefaultButtonMain(
            text: '',
            onPressed: () {
            },
          )
        ],
      ),
    );
  }




}
