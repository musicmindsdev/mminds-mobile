import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:music_minds/localization/l10n/l10n.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/view_model/locale_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final locale = ref.watch(localeProvider);
          return MaterialApp(
            builder: BotToastInit(),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            // locale: ref.watch(localeProvider),
            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            // supportedLocales: L10n.all,
            home: child,

            ///home: ,
          );
        },
        child: const SplashScreen());
  }
}
