import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  final String label;
  final String value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Statistic metric $label is $value',
      child: DashboardCard(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: AppSpacing.xxs),
            AppText(
              label,
              style: AppTextStyle.bodySmall,
              color: AppColors.white.withValues(alpha: 0.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxs),
            AppText(
              value,
              style: AppTextStyle.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
