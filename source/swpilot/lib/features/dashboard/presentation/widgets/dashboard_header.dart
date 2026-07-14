import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/app_logo.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'SWPilot',
                style: AppTextStyle.titleLarge,
              ),
              SizedBox(height: AppSpacing.xxs),
              AppText(
                'Level 999 Daily Automation',
                style: AppTextStyle.bodySmall,
                color: AppColors.primaryPurple,
              ),
            ],
          ),
        ),
        SizedBox(width: AppSpacing.md),
        AppLogo(),
      ],
    );
  }
}
