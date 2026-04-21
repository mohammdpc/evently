import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
//External Packages
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

//providers
import 'package:evently/Providers/settings_provider.dart';
//screens
import 'Onboarding/onboarding.dart';
import 'Authentication/login/log_in.dart';
import 'Main Screens/main_screen.dart';
//theme
import 'theme.dart';

//utilities
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences db = await SharedPreferences.getInstance();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //FirebaseAuth.instance;
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (_) => SettingsProvider(db),
      ),],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget mainPage() {
    if (setting.onboarding) {
      return OnboardingMain();
    } else if (setting.user == null) {
      return LogInScreen();
    } else {
      return MainScreen();
    }
  }


  @override
  Widget build(BuildContext context) {
    setting = context.watch<SettingsProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: setting.language ? Locale('en') : Locale('ar'),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      themeMode: context.watch<SettingsProvider>().theme
          ? ThemeMode.light
          : ThemeMode.dark,
      home: mainPage(),
    );
  }
}
