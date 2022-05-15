import 'package:flutter/material.dart';

const int _bluePrimaryValue = 0xFF2196F3;
const MaterialColor kPrimaryColor = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

const Color kDartColor = Color(0xFF000000);
const Color kLightColor = Color(0xFFFFFFFF);

const Color kSuccessColor = Color(0xFF009E52);
const Color kWarningColor = Color(0xFFFAD000);
const Color kErrorColor = Color(0xFFD21C09);
const Color kInfoColor = Color(0xFF0084BD);
