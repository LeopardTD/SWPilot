import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_divider.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AutomationStatusCard extends StatelessWidget {
  const AutomationStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final statusColor = AppColors.white.withValues(alpha: 0.5);

    return Semantics(
      label: 'Automation Status Info Panel',
      child: DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                'Automation Engine',
                style: AppTextStyle.titleMedium,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSpacing.xs,
                    height: AppSpacing.xs,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  AppText(
                    'Inactive',
                    style: AppTextStyle.bodyMedium,
                    color: statusColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const AppDivider(),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Last Execution',
                      style: AppTextStyle.labelMedium,
                      color: AppColors.white.withValues(alpha: 0.6),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    const AppText(
                      '--',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Next Schedule',
                      style: AppTextStyle.labelMedium,
                      color: AppColors.white.withValues(alpha: 0.6),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    const AppText(
                      '--',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}
