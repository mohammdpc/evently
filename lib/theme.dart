import 'package:flutter/material.dart';

import 'util.dart';

ThemeData appLightTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: lightBackground),
  textTheme: TextTheme(),
  scaffoldBackgroundColor: lightBackground,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsetsGeometry.symmetric(vertical: 9)),
      backgroundColor: WidgetStatePropertyAll(mainColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
      ),
    ),
  ),

  dividerColor: lightStroke,
  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: lightMainText,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      color: lightMainText,
    ),

    labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: lightMainColor,
    ),
  ),

  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
    filled: true,
    fillColor: lightInput,

    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: lightSecText
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lightStroke, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lightStroke, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: red, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);

ThemeData appDarkTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: darkBackground),
  scaffoldBackgroundColor: darkBackground,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsetsGeometry.symmetric(vertical: 9)),
      backgroundColor: WidgetStatePropertyAll(darkMainColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
      ),
    ),
  ),

  dividerColor: darkStroke,

  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: darkMainText,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      height: 1.5,
      fontSize: 16,
      color: darkMainText,
    ),

    labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: darkMainText,
    ),
  ),

  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
    filled: true,
    fillColor: darkInput,

    hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: darkSecText
    ),

    border: OutlineInputBorder(
      borderSide: BorderSide(color: darkStroke, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkStroke, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: red, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);
