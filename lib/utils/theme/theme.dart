import 'package:flutter/material.dart';

import '../../res/color.dart';
import '../../res/fonts.dart';
import '../../res/sizes.dart';
import 'text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData themeData = ThemeData(
    primarySwatch: AppColors.primaryMaterialColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: sAppBarThemeFontSize,
        fontFamily: AppFonts.sfProDisplayMedium,
        color: AppColors.primaryTextTextColor,
      ),
    ),
    textTheme: AppTextTheme.textTheme,
  );
}
