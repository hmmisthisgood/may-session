import 'package:flutter/material.dart';

class CustomTheme {
  static const darkBgColor = Color(0xff243447);
  static const lighBgColor = Colors.white;
  static const lightTextcolor = Colors.black;
  static const darkTextColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lighBgColor,
    primarySwatch: Colors.pink,
    fontFamily: "Allura",
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: lightTextcolor, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: lightTextcolor, fontSize: 22, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: lightTextcolor, fontSize: 20, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: lightTextcolor, fontSize: 18),
      headline5: TextStyle(color: lightTextcolor, fontSize: 16),
      headline6: TextStyle(color: lightTextcolor, fontSize: 14),
      bodyText1: TextStyle(color: lightTextcolor, fontSize: 12),
      bodyText2: TextStyle(color: lightTextcolor, fontSize: 10),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBgColor,
    primarySwatch: Colors.pink,
    dividerColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: darkTextColor, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: darkTextColor, fontSize: 22, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: darkTextColor, fontSize: 20, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: darkTextColor, fontSize: 18),
      headline5: TextStyle(color: darkTextColor, fontSize: 16),
      headline6: TextStyle(color: darkTextColor, fontSize: 14),
      bodyText1: TextStyle(color: darkTextColor, fontSize: 12),
      bodyText2: TextStyle(color: darkTextColor, fontSize: 10),
    ),
  );
}
