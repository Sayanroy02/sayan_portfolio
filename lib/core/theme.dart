import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      bodyLarge: GoogleFonts.montserrat(color: AppColors.lightModeTextColor),
      bodyMedium: GoogleFonts.montserrat(color: AppColors.lightModeTextColor),
      headlineLarge: GoogleFonts.montserrat(
        color: AppColors.lightModeTextColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: AppColors.lightModeTextColor,
      ),
      titleLarge: GoogleFonts.montserrat(color: AppColors.lightModeTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.lightModeTextColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.lightModeTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      bodyLarge: GoogleFonts.montserrat(color: AppColors.darkModeTextColor),
      bodyMedium: GoogleFonts.montserrat(color: AppColors.darkModeTextColor),
      headlineLarge: GoogleFonts.montserrat(color: AppColors.darkModeTextColor),
      headlineMedium: GoogleFonts.montserrat(
        color: AppColors.darkModeTextColor,
      ),
      titleLarge: GoogleFonts.montserrat(color: AppColors.darkModeTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.darkModeTextColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.darkModeTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
