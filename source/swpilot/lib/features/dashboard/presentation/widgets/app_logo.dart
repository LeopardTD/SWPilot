import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'SWPilot App Logo',
      image: true,
      child: Tooltip(
        message: 'SWPilot Logo',
        child: Container(
          width: AppSpacing.xxl,
          height: AppSpacing.xxl,
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: AppRadius.md,
          ),
          alignment: Alignment.center,
          child: const AppText(
            'SW',
            style: AppTextStyle.titleMedium,
            color: AppColors.background,
          ),
        ),
      ),
    );
  }
}
