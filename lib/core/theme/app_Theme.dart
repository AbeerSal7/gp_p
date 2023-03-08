import 'package:flutter/material.dart';
import 'package:gp/core/theme/app_colors.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.onBoardingBackground,
      textTheme: TextTheme(
        button: TextStyle(
          color: AppColors.onBoardingBackground,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        headline1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      
      ));
}
