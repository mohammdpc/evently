import 'package:flutter/cupertino.dart';

import'Providers/settings_provider.dart';

double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

double widthOf(double width,BuildContext context)=>screenWidth(context)*(width/375);
double heightOf(double height,BuildContext context)=>screenHeight(context)*(height/812);

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
  //onboarding
String sun = 'assets/icons/sun.png';
String moon = 'assets/icons/Vector.png';
String moonFilled = 'assets/icons/moon.png';
  //Authentication
String emailIcon = 'assets/icons/sms.png';
String passwordIcon = 'assets/icons/lock.png';
String userIcon = 'assets/icons/user.png';
String googleIcon = 'assets/icons/image 6.png';
  //main screen
String filledHeart = 'assets/icons/heart.png';
String heart = 'assets/icons/heart-1.png';
String home = 'assets/icons/home.png';
String profile = 'assets/icons/user.png';

String allTab = 'assets/icons/element-3.png';
String sportsIcon = 'assets/icons/bike.png';
String birthday = 'assets/icons/birthday-cake.png';
String bookClub = 'assets/icons/book.png';
String meeting = 'assets/icons/calendar-add.png';
String exhibition = 'assets/icons/clock.png';

// images paths
  //Onboarding images
String evently= 'assets/images/EventlyLogo.png';
String onboardingHome = 'assets/images/being-creative.png';
String onboarding1 = 'assets/images/hot-trending.png';
String onboarding2 = 'assets/images/being-creative-1.png';
String onboarding3 = 'assets/images/being-creative-2.png';
  //Authentication
String forgotPasswordImage = 'assets/images/change-setting.png';

  //event
  List<String> eventImageDarkList = [
    'assets/images/Sport.png',
    'assets/images/Birthday.png',
    'assets/images/Meeting.png',
    'assets/images/Exhibition.png',
    'assets/images/Book Club.png',
  ];

   List<String> eventImageLightList = [
    'assets/images/Sport-1.png',
     'assets/images/Birthday-1.png',
    'assets/images/Meeting-1.png',
    'assets/images/Exhibition-1.png',
     'assets/images/Book Club-1.png',
  ];
  
