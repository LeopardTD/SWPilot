import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.md,
        border: Border.all(color: AppColors.primaryPurple, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.3),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const AppText(
        'SW',
        style: AppTextStyle.displayMedium,
        color: AppColors.cyan,
      ),
    );
  }
}
