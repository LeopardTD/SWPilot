import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';

class TaglineSection extends StatelessWidget {
  const TaglineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          'SWPilot',
          style: AppTextStyle.displaySmall,
          color: AppColors.white,
        ),
        SizedBox(height: AppSpacing.xs),
        AppText(
          'Level 999 Daily Automation',
          style: AppTextStyle.bodyMedium,
          color: AppColors.primaryPurple,
        ),
      ],
    );
  }
}
