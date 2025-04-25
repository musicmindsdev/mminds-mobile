import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view/screens/dashboard/message_screen/chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        SizedBox(height: 20.h,),
        ListTile(
          onTap: (){
            navigatePush(context, ChatScreen());
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          leading:
          Container(
            width: 54.0,
            height: 54.0,
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
            fontSize: 18.spMin,
          ),
          subtitle: TextView(
            text: 'Hello!',
            fontSize: 14.spMin,
            fontWeight: FontWeight.w500,
            color: AppColors.KUserProfileNeutral,
          ),
          trailing:TextView(
            text: '3 : 00 AM',
            fontSize: 10.spMin,
            fontWeight: FontWeight.w500,
            color: AppColors.KUserProfileNeutral,
          ) ,
        )
      ],),),
    );
  }
}
