import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/fonts.dart';

class AppTheme {
  static final themeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
  );


  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    textTheme: const TextTheme(
      headline1: AppFonts.headingStyle1,
      bodyText1: AppFonts.bodyStyle,
    ),
  );
}
