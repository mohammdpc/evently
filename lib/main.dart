import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
//External Packages
import 'package:provider/provider.dart';

//providers
import 'Providers/settings_provider.dart';
//screens
import 'Onboarding/onboarding.dart';
//theme
import 'theme.dart';
//utilities
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: setting),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: setting.language?Locale('en'):Locale('ar'),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      themeMode: context.watch<SettingsProvider>().theme?ThemeMode.light:ThemeMode.dark,
      home: OnboardingMain(),
    );
  }
}
