import 'package:flutter/cupertino.dart';

import'Providers/settings_provider.dart';

double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

double widthOf(double width,BuildContext context)=>screenWidth(context)*(width/375);
double heightOf(double height,BuildContext context)=>screenHeight(context)*(height/812);

//light
const Color lightMainColor = Color(0xff0E3A99);
const Color lightDisable = Color(0xffB9B9B9);
const Color lightMainText = Color(0xff1C1C1C);
const Color lightSecText = Color(0xff686868);
const Color lightBackground = Color(0xffF4F7FF);
const Color lightInput = Color(0xffFFFFFF);
const Color lightStroke = Color(0xffF0F0F0);
const Color red = Color(0xffFF3232);

//dark

const Color darkMainColor = Color(0xff457AED);
const Color darkMainText = Color(0xffFFFFFF);
const Color darkSecText = Color(0xffD6D6D6);
const Color darkBackground = Color(0xff000F30);
const Color darkInput = Color(0xff001440);
const Color darkStroke = Color(0xff002D8F);

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
const String sun = 'assets/icons/sun.png';
const String moon = 'assets/icons/Vector.png';
const String moonFilled = 'assets/icons/moon.png';
  //Authentication
const String emailIcon = 'assets/icons/sms.png';
const String passwordIcon = 'assets/icons/lock.png';
const String userIcon = 'assets/icons/user.png';
const String googleIcon = 'assets/icons/image 6.png';
  //main screen
const String filledHeart = 'assets/icons/heart.png';
const String heart = 'assets/icons/heart-1.png';
const String home = 'assets/icons/home.png';
const String profile = 'assets/icons/user.png';

const String allTab = 'assets/icons/element-3.png';
const String sportsIcon = 'assets/icons/bike.png';
const String birthday = 'assets/icons/birthday-cake.png';
const String bookClub = 'assets/icons/book.png';
const String meeting = 'assets/icons/calendar-add.png';
const String exhibition = 'assets/icons/clock.png';

const String searchIcon = 'assets/icons/search.png';
const String logoutIcon = 'assets/icons/logout.png';

const String trashIcon = 'assets/icons/trash.png';
const String editIcon = 'assets/icons/edit.png';
const String calender = 'assets/icons/calendar-add.png';

// images paths
  //Onboarding images
const String evently= 'assets/images/EventlyLogo.png';
const String onboardingHome = 'assets/images/being-creative.png';
const String onboarding1 = 'assets/images/hot-trending.png';
const String onboarding2 = 'assets/images/being-creative-1.png';
const String onboarding3 = 'assets/images/being-creative-2.png';
  //Authentication
const String forgotPasswordImage = 'assets/images/change-setting.png';

  //event
const   List<String> eventImageDarkList = [
    'assets/images/Sport.png',
    'assets/images/Birthday.png',
    'assets/images/Meeting.png',
    'assets/images/Exhibition.png',
    'assets/images/Book Club.png',
  ];

const    List<String> eventImageLightList = [
    'assets/images/Sport-1.png',
     'assets/images/Birthday-1.png',
    'assets/images/Meeting-1.png',
    'assets/images/Exhibition-1.png',
     'assets/images/Book Club-1.png',
  ];
const String profileImage = 'assets/images/profile_image.png';
  
