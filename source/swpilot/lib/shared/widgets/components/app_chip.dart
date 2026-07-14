import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/theme/app_text_theme.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    super.key,
    this.backgroundColor,
    this.textColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color:
            backgroundColor ?? AppColors.primaryPurple.withValues(alpha: 0.15),
        borderRadius: AppRadius.xs,
        border: Border.all(
          color:
              backgroundColor ?? AppColors.primaryPurple.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: AppTextTheme.labelSmall.copyWith(
          color: textColor ?? AppColors.cyan,
        ),
      ),
    );
  }
}
