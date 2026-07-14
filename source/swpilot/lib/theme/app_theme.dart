import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryPurple,
        secondary: AppColors.secondaryPurple,
        tertiary: AppColors.cyan,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onTertiary: AppColors.background,
        onSurface: AppColors.white,
        onError: AppColors.white,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextTheme.displayLarge,
        displayMedium: AppTextTheme.displayMedium,
        displaySmall: AppTextTheme.displaySmall,
        headlineLarge: AppTextTheme.headlineLarge,
        headlineMedium: AppTextTheme.headlineMedium,
        headlineSmall: AppTextTheme.headlineSmall,
        titleLarge: AppTextTheme.titleLarge,
        titleMedium: AppTextTheme.titleMedium,
        titleSmall: AppTextTheme.titleSmall,
        bodyLarge: AppTextTheme.bodyLarge,
        bodyMedium: AppTextTheme.bodyMedium,
        bodySmall: AppTextTheme.bodySmall,
        labelLarge: AppTextTheme.labelLarge,
        labelMedium: AppTextTheme.labelMedium,
        labelSmall: AppTextTheme.labelSmall,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      dividerTheme: const DividerThemeData(
        color: AppColors.surface,
        thickness: 1.0,
        space: AppSpacing.md,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.all(AppSpacing.md),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.sm,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.sm,
          borderSide: BorderSide(color: AppColors.surface),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.sm,
          borderSide: BorderSide(color: AppColors.cyan),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.sm,
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTextTheme.labelMedium,
        hintStyle: AppTextTheme.bodyMedium.copyWith(
          color: AppColors.white.withValues(alpha: 0.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
          textStyle: AppTextTheme.titleMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.cyan,
          side: const BorderSide(color: AppColors.cyan),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
          textStyle: AppTextTheme.titleMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.cyan,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
          textStyle: AppTextTheme.titleMedium,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.cyan,
        linearTrackColor: AppColors.surface,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.surface,
        contentTextStyle: TextStyle(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.sm),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        titleTextStyle: AppTextTheme.titleLarge,
        contentTextStyle: AppTextTheme.bodyMedium,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.cyan,
        unselectedItemColor: AppColors.white.withValues(alpha: 0.6),
        selectedLabelStyle: AppTextTheme.labelSmall,
        unselectedLabelStyle: AppTextTheme.labelSmall,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.cyan;
          }
          return AppColors.white.withValues(alpha: 0.6);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPurple.withValues(alpha: 0.5);
          }
          return AppColors.surface;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.cyan;
          }
          return AppColors.surface;
        }),
        checkColor: WidgetStateProperty.all(AppColors.background),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.xs),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.cyan;
          }
          return AppColors.surface;
        }),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.cyan,
        foregroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.sm),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.cyan,
        selectionColor: AppColors.primaryPurple,
        selectionHandleColor: AppColors.cyan,
      ),
      splashColor: AppColors.primaryPurple.withValues(alpha: 0.1),
      highlightColor: AppColors.cyan.withValues(alpha: 0.1),
    );
  }
}
