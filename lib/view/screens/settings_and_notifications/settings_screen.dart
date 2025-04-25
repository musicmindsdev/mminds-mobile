import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/utils/alerts.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:music_minds/view_model/locale_provider.dart';


import '../../../src/components.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
              height: 10.h,
            ),
            headerWidget(),
            SizedBox(
              height: 28.h,
            ),

            // TextView(
            //   text: AppLocalizations.of(context)!.acknowledgement,
            //   fontSize: 12.spMin,
            //   fontWeight: FontWeight.w500,
            //   color: AppColors.KUserProfileNeutral,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextView(
                text: 'Account'.toUpperCase(),
                fontSize: 12.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.KUserProfileNeutral,
              ),
            ),
            listAccountWidgetItems(),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              endIndent: 10.w,
              indent: 10.w,
              color: AppColors.KDivider,
              height: 1.0.h,
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextView(
                text: 'Legal'.toUpperCase(),
                fontSize: 12.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.KUserProfileNeutral,
              ),
            ),
            listLegalWidgetItems(),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              endIndent: 10.w,
              indent: 10.w,
              color: AppColors.KDivider,
              height: 1.0.h,
            ),
            logoutWidget()
        ],
      ),
          )),
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
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  listWidget(
      {required String imagePath,
      required String title,
      required Function() onTap, Color? titleColor}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      minLeadingWidth: 4.w,
      onTap: onTap,
      leading: Image.asset(
        imagePath,
        height: 22.h,
        width: 22.w,
      ),
      title: TextView(
        text: title,
        fontSize: 16.spMin,
        fontWeight: FontWeight.w400,
        color: titleColor?? AppColors.KTextBlack,
      ),
    );
  }

  listAccountWidgetItems() {
    return Column(
      children: [
        listWidget(
            imagePath: AppAsset.documentUploadIcon, title: 'KYC', onTap: (){}),
        listWidget(
            imagePath: AppAsset.lockIcon, title: 'Change password', onTap: (){}),
        listWidget(
            imagePath: AppAsset.notificationAccountIcon, title: 'Notification', onTap: (){}),
        listWidget(
            imagePath: AppAsset.notificationAccountIcon, title: 'App language', onTap: (){
          showLocaleBottomModalSheet(context, widget: RadioOptionLocaleList());
        }),
      ],
    );
  }

  listLegalWidgetItems() {
    return Column(
      children: [

        listWidget(
            imagePath: AppAsset.shieldIcon, title: 'Terms and conditions', onTap: (){}),
        listWidget(
            imagePath: AppAsset.openBookIcon, title: 'Privacy policy', onTap: (){}),
        listWidget(
            imagePath: AppAsset.messageQuestionIcon, title: 'FAQs', onTap: (){}),
        listWidget(
            imagePath: AppAsset.supportIcon, title: 'Help and support', onTap: (){

        }),
      ],
    );
  }



  logoutWidget(){
    return listWidget(imagePath: AppAsset.logOutIcon, titleColor:AppColors.KErrorPrimary ,title: 'Logout', onTap: (){});
  }
  feedListSelectImageOption() {
    final locale = ref.watch(localeProvider);
    return Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile<Locale>(
          title: Text('English'),
          value: Locale('en'),
          groupValue: locale,
          onChanged: (Locale? value) { // Change the parameter type to Locale?
            if (value != null) {
              setState(() {
                // ref.watch(localeProvider.notifier).setLocale(value);
                // ref.read(localeProvider.notifier).state = value;
                ref.read(localeProvider.notifier).setLocale(value);
              });
            }
          },
        ),
        RadioListTile<Locale>(
          title: Text('Español'),
          value: Locale('fr'),
          groupValue: locale,
          onChanged: (Locale? value) { // Change the parameter type to Locale?
            if (value != null) {
              setState(() {
                // ref.watch(localeProvider.notifier).setLocale(value);
                ref.read(localeProvider.notifier).setLocale(value);
              });
            }
          },
        ),

      ],
    );
  }
}

class RadioOptionLocaleList extends ConsumerStatefulWidget {
  const RadioOptionLocaleList({super.key});

  @override
  ConsumerState<RadioOptionLocaleList> createState() => _RadioOptionLocaleListState();
}

class _RadioOptionLocaleListState extends ConsumerState<RadioOptionLocaleList> {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    return Scaffold(
      body: SingleChildScrollView(child: Column(

        // mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<Locale>(
            title: Text('English'),
            value: Locale('en'),
            groupValue: locale,
            onChanged: (Locale? value) { // Change the parameter type to Locale?
              if (value != null) {
                setState(() {
                  // ref.watch(localeProvider.notifier).setLocale(value);
                  // ref.read(localeProvider.notifier).state = value;
                  ref.read(localeProvider.notifier).setLocale(value);
                });
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text('French'),
            value: Locale('fr'),
            groupValue: locale,
            onChanged: (Locale? value) { // Change the parameter type to Locale?
              if (value != null) {
                setState(() {
                  // ref.watch(localeProvider.notifier).setLocale(value);
                  ref.read(localeProvider.notifier).setLocale(value);
                });
              }
            },
          ),
          RadioListTile<Locale>(title: Text('Germany'),
            value: Locale('de'),
            groupValue: locale,
            onChanged: (Locale? value) { // Change the parameter type to Locale?
              if (value != null) {
                setState(() {
                  // ref.watch(localeProvider.notifier).setLocale(value);
                  // ref.read(localeProvider.notifier).state = value;
                  ref.read(localeProvider.notifier).setLocale(value);
                });
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text('Spain'),
            value: Locale('es'),
            groupValue: locale,
            onChanged: (Locale? value) { // Change the parameter type to Locale?
              if (value != null) {
                setState(() {
                  // ref.watch(localeProvider.notifier).setLocale(value);
                  // ref.read(localeProvider.notifier).state = value;
                  ref.read(localeProvider.notifier).setLocale(value);
                });
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text('Italy'),
            value: Locale('it'),
            groupValue: locale,
            onChanged: (Locale? value) { // Change the parameter type to Locale?
              if (value != null) {
                setState(() {
                  // ref.watch(localeProvider.notifier).setLocale(value);
                  // ref.read(localeProvider.notifier).state = value;
                  ref.read(localeProvider.notifier).setLocale(value);
                });
              }
            },
          ),

        ],
      )),
    );
  }
}

