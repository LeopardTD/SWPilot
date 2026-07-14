import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/statistics_card.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class StatisticsSummarySection extends StatelessWidget {
  const StatisticsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      (
        label: 'Successful Runs',
        value: '0',
        icon: Icons.check_circle_outline_rounded
      ),
      (
        label: 'Failed Runs',
        value: '0',
        icon: Icons.error_outline_rounded
      ),
      (
        label: 'Today\'s Tasks',
        value: '0',
        icon: Icons.today_rounded
      ),
      (
        label: 'Success Rate',
        value: '0%',
        icon: Icons.percent_rounded
      ),
    ];

    return DashboardSection(
      title: 'Statistics Summary',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
          final childAspectRatio = constraints.maxWidth > 600 ? 1.5 : 1.2;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: stats.length,
            itemBuilder: (context, index) {
              final item = stats[index];
              return StatisticsCard(
                label: item.label,
                value: item.value,
                icon: Icon(
                  item.icon,
                  color: AppColors.cyan,
                  size: AppSpacing.xl,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
