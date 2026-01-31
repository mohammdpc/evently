import 'package:flutter/cupertino.dart';

import'Providers/settings_provider.dart';

double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

//light
Color lightMainColor = Color(0xff0E3A99);
Color lightDisable = Color(0xffB9B9B9);
Color lightMainText = Color(0xff1C1C1C);
Color lightSecText = Color(0xff686868);
Color lightBackground = Color(0xffF4F7FF);
Color lightInput = Color(0xffFFFFFF);
Color lightStroke = Color(0xffF0F0F0);
Color red = Color(0xffFF3232);

//dark

Color darkMainColor = Color(0xff457AED);
Color darkMainText = Color(0xffFFFFFF);
Color darkSecText = Color(0xffD6D6D6);
Color darkBackground = Color(0xff000F30);
Color darkInput = Color(0xff001440);
Color darkStroke = Color(0xff002D8F);

//theme colors
Color get mainColor=>setting.theme?lightMainColor:darkMainColor;
Color get disableColor=>lightDisable;
Color get mainText=>setting.theme?lightMainText:darkMainText;
Color get secText=>setting.theme?lightSecText:darkSecText;
Color get background=>setting.theme?lightBackground:darkBackground;
Color get input=>setting.theme?lightInput:darkInput;
Color get stroke=>setting.theme?lightStroke:darkStroke;
Color? get imageColor=>setting.theme?null:darkMainText;



//icons
String sun = 'assets/icons/sun.png';
String moon = 'assets/icons/Vector.png';
String moonFilled = 'assets/icons/moon.png';

// images paths
  //Onboarding images
String evently= 'assets/images/EventlyLogo.png';
String onboardingHome = 'assets/images/being-creative.png';
String onboarding1 = 'assets/images/hot-trending.png';
String onboarding2 = 'assets/images/being-creative-1.png';
String onboarding3 = 'assets/images/being-creative-2.png';
