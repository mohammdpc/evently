import 'package:evently/util.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "../l10n/app_localizations.dart";

import '../Providers/settings_provider.dart';

import '../Authentication/log_in.dart';

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
        title: Image.asset(evently, width: screenWidth(context) * 0.378666667,color: mainColor),
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

class OnboardingSlides extends StatefulWidget {
  const OnboardingSlides({super.key});

  @override
  State<OnboardingSlides> createState() => _OnboardingSlidesState();
}

class _OnboardingSlidesState extends State<OnboardingSlides> {
  int pageIndex = 0;
  late final PageController pageController;
  late final PageController textPageController;

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    textPageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      AppLocalizations.of(context)!.onboardingTitle1,
      AppLocalizations.of(context)!.onboardingTitle2,
      AppLocalizations.of(context)!.onboardingTitle3,
    ];
    List<String> bodyList = [
      AppLocalizations.of(context)!.onboardingText1,
      AppLocalizations.of(context)!.onboardingText2,
      AppLocalizations.of(context)!.onboardingText3,
    ];
    List<String> imageList = [onboarding1, onboarding2, onboarding3];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top:  screenWidth(context) * 0.042666667,left: screenWidth(context) * 0.042666667,right: screenWidth(context) * 0.042666667),
          child: Column(
            spacing: screenHeight(context) * 0.02955665,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.085333333,
                    height: screenWidth(context) * 0.085333333,
                    child: pageIndex == 0
                        ? null
                        : FilledButton(
                            style: Theme.of(context).filledButtonTheme.style!
                                .copyWith(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      horizontal:
                                          screenWidth(context) * 0.029333333,
                                      vertical:
                                          screenHeight(context) * 0.009852217,
                                    ),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(input),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.all(
                                        Radius.circular(8),
                                      ),
                                      side: BorderSide(color: stroke),
                                    ),
                                  ),
                                ),
                            onPressed: () {
                              pageIndex -= 1;
                              pageController.animateToPage(
                                pageIndex,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                              textPageController.animateToPage(
                                pageIndex,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                              setState(() {});
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: setting.theme ? mainColor : lightInput,
                              weight: screenWidth(context) * 0.018933333,
                            ),
                          ),
                  ),
        
                  Image.asset(evently, width: screenWidth(context) * 0.378666667,color: mainColor),
        
                  SizedBox(
                    width: screenWidth(context) * 0.168,
                    height: screenWidth(context) * 0.085333333,
                    child: pageIndex == 2
                        ? null
                        : FilledButton(
                      style: Theme.of(context).filledButtonTheme.style!
                          .copyWith(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal:
                            screenWidth(context) * 0.029333333,
                            vertical:
                            screenHeight(context) * 0.009852217,
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(input),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(color: stroke),
                          ),
                        ),
                      ),
                      onPressed: () {
                        pageIndex = 2;
                        pageController.animateToPage(
                          pageIndex,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                        textPageController.animateToPage(
                          pageIndex,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                        setState(() {});
                      },
                      child: Text(AppLocalizations.of(context)!.skip,style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(fontSize: 14),)
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      Image.asset(imageList[index], color: imageColor),
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 6,
                  expansionFactor: 2.6,
                  activeDotColor: mainColor,
                  dotColor: setting.theme ? disableColor : lightBackground,
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: textPageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => OnboardingText(
                    title: titleList[index],
                    body: bodyList[index],
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  if (pageIndex < 2) {
                    pageIndex += 1;
                    pageController.animateToPage(
                      pageIndex,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                    textPageController.animateToPage(
                      pageIndex,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                    setState(() {});
                  } else {
                    setting.onBoarding();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  }
                },
                child: Center(
                  child: Text(
                    pageIndex == 2
                        ? AppLocalizations.of(context)!.getStarted
                        : AppLocalizations.of(context)!.next,
                    style: Theme.of(context).primaryTextTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingText extends StatelessWidget {
  final String title;
  final String body;
  const OnboardingText({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: screenHeight(context) * 0.019704433,
      children: [
        Text(title, style: Theme.of(context).primaryTextTheme.bodyLarge),
        Text(body, style: Theme.of(context).primaryTextTheme.bodySmall),
      ],
    );
  }
}
