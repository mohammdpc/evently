import 'package:evently/util.dart';
import 'package:flutter/material.dart';
import "../l10n/app_localizations.dart";
import '../Providers/settings_provider.dart';

import 'onboarding_slides.dart';


class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          evently,
          width: screenWidth(context) * 0.378666667,
          color: mainColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth(context) * 0.042666667),
        child: Column(
          spacing: screenHeight(context) * 0.02955665,
          children: [
            Expanded(child: Image.asset(onboardingHome, color: imageColor)),
            Column(
              spacing: screenHeight(context) * 0.019704433,
              children: [
                Align(
                  alignment: setting.language
                      ? AlignmentGeometry.centerLeft
                      : AlignmentGeometry.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.personalizeYourExperience,
                    style: Theme.of(context).primaryTextTheme.bodyLarge,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.onboardingMainText,
                  style: Theme.of(context).primaryTextTheme.bodySmall,
                ),
                Row(
                  spacing: screenWidth(context) * 0.021333333,
                  verticalDirection:
                      AppLocalizations.of(context)!.localeName == 'en'
                      ? VerticalDirection.up
                      : VerticalDirection.down,
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.language,
                        style: Theme.of(context).primaryTextTheme.labelMedium,
                      ),
                    ),
                    FilledButton(
                      onPressed: () => setting.languageToEN(),
                      style: Theme.of(context).filledButtonTheme.style!
                          .copyWith(
                            backgroundColor: WidgetStatePropertyAll(
                              !setting.language ? input : mainColor,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: setting.language ? Colors.white : mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () => setting.languageToAR(),
                      style: Theme.of(context).filledButtonTheme.style!
                          .copyWith(
                            backgroundColor: WidgetStatePropertyAll(
                              setting.language ? input : mainColor,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                      child: Text(
                        'Arabic',
                        style: TextStyle(
                          color: !setting.language ? Colors.white : mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: screenWidth(context) * 0.021333333,
                  verticalDirection:
                      AppLocalizations.of(context)!.localeName == 'en'
                      ? VerticalDirection.up
                      : VerticalDirection.down,
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.theme,
                        style: Theme.of(context).primaryTextTheme.labelMedium,
                      ),
                    ),
                    FilledButton(
                      onPressed: () => setting.themeToLight(),
                      style: Theme.of(context).filledButtonTheme.style!
                          .copyWith(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              setting.theme ? mainColor : darkInput,
                            ),
                          ),
                      child: Image.asset(
                        sun,
                        width: screenWidth(context) * 0.064,
                      ),
                    ),
                    FilledButton(
                      onPressed: () => setting.themeToDark(),
                      style: Theme.of(context).filledButtonTheme.style!
                          .copyWith(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              setting.theme ? input : darkMainColor,
                            ),
                          ),
                      child: Image.asset(
                        setting.theme ? moon : moonFilled,
                        width: screenWidth(context) * 0.064,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingSlides()),
                );
              },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.letsStart,
                  style: Theme.of(context).primaryTextTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




