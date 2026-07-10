import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
    ),
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}
