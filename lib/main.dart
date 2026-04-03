import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'core/theme/app_theme.dart';
import 'core/config/app_config.dart';

import 'l10n/app_localizations.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/home/home_screen.dart';
import 'core/services/ad_service.dart';
// Diese Imports werden in späteren Prompts einkommentiert:
// import 'core/services/billing_service.dart';             // Prompt 6

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  tz.initializeTimeZones();

  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(android: androidSettings),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await AdService.initPremiumStatus();

  final prefs          = await SharedPreferences.getInstance();
  final onboardingDone = prefs.getBool('onboarding_done') ?? false;

  runApp(MyApp(onboardingDone: onboardingDone));
}

class MyApp extends StatelessWidget {
  final bool onboardingDone;
  const MyApp({super.key, required this.onboardingDone});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('de'), Locale('en'), Locale('fr'), Locale('es'), Locale('it'),
        Locale('pt'), Locale('nl'), Locale('pl'), Locale('cs'), Locale('sk'),
        Locale('hu'), Locale('ro'), Locale('bg'), Locale('hr'), Locale('sl'),
        Locale('lt'), Locale('lv'), Locale('et'), Locale('fi'), Locale('sv'),
        Locale('da'), Locale('nb'), Locale('el'), Locale('tr'), Locale('ru'),
        Locale('uk'), Locale('ar'), Locale('zh'), Locale('ja'), Locale('ko'),
        Locale('hi'), Locale('id'), Locale('th'),
      ],
      home: onboardingDone ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
