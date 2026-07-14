import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class ActivityTimelineItem extends StatelessWidget {
  const ActivityTimelineItem({
    required this.time,
    required this.description,
    super.key,
  });

  final String time;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Activity at $time: $description',
      child: DashboardCard(
        child: Row(
          children: [
            Container(
              width: AppSpacing.xs,
              height: AppSpacing.xs,
              decoration: const BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            AppText(
              time,
              style: AppTextStyle.bodyMedium,
              color: AppColors.white.withValues(alpha: 0.6),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: AppText(
                description,
                style: AppTextStyle.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
