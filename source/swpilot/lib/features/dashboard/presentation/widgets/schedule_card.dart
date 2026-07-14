import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    required this.taskName,
    required this.nextRun,
    required this.status,
    super.key,
  });

  final String taskName;
  final String nextRun;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Scheduled Task: $taskName. Status is $status. Next run at $nextRun.',
      child: DashboardCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppText(
                    taskName,
                    style: AppTextStyle.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withValues(alpha: 0.1),
                    borderRadius: AppRadius.sm,
                  ),
                  child: AppText(
                    status,
                    style: AppTextStyle.labelSmall,
                    color: AppColors.cyan,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Next Run',
                  style: AppTextStyle.bodySmall,
                  color: AppColors.white.withValues(alpha: 0.6),
                ),
                AppText(
                  nextRun,
                  style: AppTextStyle.bodySmall,
                  color: AppColors.white.withValues(alpha: 0.6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
