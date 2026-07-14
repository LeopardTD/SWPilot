import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swpilot/theme/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextStyle baseInter = GoogleFonts.inter();
  static final TextStyle baseMono = GoogleFonts.jetBrainsMono();

  static final TextStyle displayLarge = baseInter.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    height: 1.12,
    color: AppColors.white,
  );
  static final TextStyle displayMedium = baseInter.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.16,
    color: AppColors.white,
  );
  static final TextStyle displaySmall = baseInter.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22,
    color: AppColors.white,
  );

  static final TextStyle headlineLarge = baseInter.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.25,
    color: AppColors.white,
  );
  static final TextStyle headlineMedium = baseInter.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.29,
    color: AppColors.white,
  );
  static final TextStyle headlineSmall = baseInter.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: AppColors.white,
  );

  static final TextStyle titleLarge = baseInter.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.27,
    color: AppColors.white,
  );
  static final TextStyle titleMedium = baseInter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.white,
  );
  static final TextStyle titleSmall = baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    color: AppColors.white,
  );

  static final TextStyle bodyLarge = baseInter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.white,
  );
  static final TextStyle bodyMedium = baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    color: AppColors.white,
  );
  static final TextStyle bodySmall = baseInter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: AppColors.white,
  );

  static final TextStyle labelLarge = baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    color: AppColors.white,
  );
  static final TextStyle labelMedium = baseInter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    color: AppColors.white,
  );
  static final TextStyle labelSmall = baseInter.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    color: AppColors.white,
  );

  static final TextStyle terminalLarge = baseMono.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.cyan,
  );
  static final TextStyle terminalMedium = baseMono.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    color: AppColors.cyan,
  );
  static final TextStyle terminalSmall = baseMono.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: AppColors.cyan,
  );
}
