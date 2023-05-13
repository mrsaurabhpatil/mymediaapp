import 'package:flutter/material.dart';

import '../../../res/res/color.dart';
import '../../../res/res/fonts.dart';
import '../../../res/res/sizes.dart';


class AppTextTheme {
  AppTextTheme._();
  static TextTheme textTheme = const TextTheme(
    /// HEADLINE 1
    displayLarge: TextStyle(
      fontSize: sTxtThemeFontSizeDisLar,
      fontFamily: AppFonts.sfProDisplayMedium,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: sTxtThemeFontHeightDisLar,
    ),

    /// HEADLINE 2
    displayMedium: TextStyle(
      fontSize: sTxtThemeFontSizeDisMed,
      fontFamily: AppFonts.sfProDisplayMedium,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: sTxtThemeFontHeightDisMed,
    ),

    /// HEADLINE 3
    displaySmall: TextStyle(
      fontSize: sTxtThemeFontSizeDisSma,
      fontFamily: AppFonts.sfProDisplayMedium,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: sTxtThemeFontHeightDisSma,
    ),

    /// HEADLINE 4
    headlineMedium: TextStyle(
      fontSize: sTxtThemeFontSizeHeaMed,
      fontFamily: AppFonts.sfProDisplayMedium,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: sTxtThemeFontHeightHeaMed,
    ),

    /// HEADLINE 5
    headlineSmall: TextStyle(
      fontSize: sTxtThemeFontSizeHeaSma,
      fontFamily: AppFonts.sfProDisplayMedium,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: sTxtThemeFontHeightHeaSma,
    ),

    /// HEADLINE 6
    titleLarge: TextStyle(
      fontSize: sTxtThemeFontSizeTitLar,
      fontFamily: AppFonts.sfProDisplayBold,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w700,
      height: sTxtThemeFontHeightTitLar,
    ),

    /// BODY TEXT 1
    bodyLarge: TextStyle(
      fontSize: sTxtThemeFontSizeTitLar,
      fontFamily: AppFonts.sfProDisplayBold,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w700,
      height: sTxtThemeFontHeightTitLar,
    ),

    /// BODY TEXT 2
    bodyMedium: TextStyle(
      fontSize: sTxtThemeFontSizeTitLar,
      fontFamily: AppFonts.sfProDisplayRegular,
      color: AppColors.primaryTextTextColor,
      height: sTxtThemeFontHeightTitLar,
    ),

    /// CAPTIONS
    bodySmall: TextStyle(
      fontSize: sTxtThemeFontSizeTitLar,
      fontFamily: AppFonts.sfProDisplayRegular,
      color: AppColors.primaryTextTextColor,
      height: sTxtThemeFontHeightTitLar,
    ),
  );
}
