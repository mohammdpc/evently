import 'package:flutter/material.dart';

import 'util.dart';

ThemeData appLightTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: background),
  textTheme: TextTheme(

  ),
  scaffoldBackgroundColor: background,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(mainColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
      ),
    ),
  ),

  disabledColor: disableColor,
  primaryColor: mainColor,

  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: lightMainText,
        fontFamily: 'Poppins'
    ),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
        color: lightMainText
    ),

      labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: lightMainColor
    )

  )
);

ThemeData appDarkTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: darkBackground),
  scaffoldBackgroundColor: darkBackground,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(darkMainColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
      ),
    ),
  ),
  disabledColor: disableColor,
  primaryColor: darkMainColor,

    primaryTextTheme: TextTheme(
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: darkMainText,
            fontFamily: 'Poppins'
        ),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          height: 1.5,
          fontSize: 16,
          color: darkMainText
      ),

        labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
        ),
            labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: darkMainText
        )
    )
);