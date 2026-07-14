import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DailyCheckInCard extends StatelessWidget {
  const DailyCheckInCard({
    required this.gameName,
    required this.initials,
    required this.status,
    super.key,
  });

  final String gameName;
  final String initials;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Daily Check-in status for $gameName is $status',
      child: DashboardCard(
        child: Row(
          children: [
            Container(
              width: AppSpacing.xl,
              height: AppSpacing.xl,
              decoration: const BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: AppText(
                initials,
                style: AppTextStyle.labelMedium,
                color: AppColors.background,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: AppText(
                gameName,
                style: AppTextStyle.bodyMedium,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.1),
                borderRadius: AppRadius.sm,
              ),
              child: AppText(
                status,
                style: AppTextStyle.labelSmall,
                color: AppColors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
