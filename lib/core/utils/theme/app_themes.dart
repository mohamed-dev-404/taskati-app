import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati_app/core/utils/styles/app_fonts.dart';
import 'package:taskati_app/core/utils/colors/app_colors.dart';
import 'package:taskati_app/core/utils/styles/text_styles.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.lexendDeca,
    scaffoldBackgroundColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: const DividerThemeData(color: AppColors.secondaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: AppStyles.title.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.lexendDeca,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.backgroundColor,
      filled: true,
      hintStyle: AppStyles.caption1.copyWith(color: AppColors.secondaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
