import 'package:flutter/material.dart';

const int _primaryValue = 0xFF4DCFFA;
const int _secondaryValue = 0xFF573BE3;

const MaterialColor kPrimaryColor = MaterialColor(
  _primaryValue,
  <int, Color>{
    50: Color(0xFFEAF9FE),
    100: Color(0xFFCAF1FE),
    200: Color(0xFFA6E7FD),
    300: Color(0xFF82DDFC),
    400: Color(0xFF68D6FB),
    500: Color(_primaryValue),
    600: Color(0xFF46CAF9),
    700: Color(0xFF3DC3F9),
    800: Color(0xFF34BDF8),
    900: Color(0xFF25B2F6),
  },
);

const MaterialColor kSecondaryColor = MaterialColor(
  _secondaryValue,
  <int, Color>{
    50: Color(0xFFEBE7FC),
    100: Color(0xFFCDC4F7),
    200: Color(0xFFAB9DF1),
    300: Color(0xFF8976EB),
    400: Color(0xFF7058E7),
    500: Color(_secondaryValue),
    600: Color(0xFF4F35E0),
    700: Color(0xFF462DDC),
    800: Color(0xFF3C26D8),
    900: Color(0xFF2C19D0),
  },
);

const Color kDartColor = Color(0xFF000000);
const Color kLightColor = Color(0xFFFFFFFF);

const Color kSuccessColor = Color(0xFF009E52);
const Color kWarningColor = Color(0xFFFAD000);
const Color kErrorColor = Color(0xFFD21C09);
const Color kInfoColor = Color(0xFF0084BD);

final themeData = ThemeData(
  primaryColor: kPrimaryColor,
  colorScheme: const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  iconTheme: const IconThemeData(color: Colors.red),
  primarySwatch: Colors.yellow,
  scaffoldBackgroundColor: Colors.blue[400],
  buttonTheme: ButtonThemeData(
    hoverColor: Colors.amber.withAlpha(150),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.green),
    ),
  ),
);

final themeDataDark = ThemeData.dark();
