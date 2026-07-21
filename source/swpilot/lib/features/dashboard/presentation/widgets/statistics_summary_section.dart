import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/statistics/statistics.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/statistics_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class StatisticsSummarySection extends ConsumerWidget {
  const StatisticsSummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(statisticsControllerProvider);

    if (statsState.isLoading) {
      return const DashboardSection(
        title: 'Statistics Summary',
        child: SizedBox(
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.cyan,
            ),
          ),
        ),
      );
    }

    if (statsState.error != null) {
      return DashboardSection(
        title: 'Statistics Summary',
        child: DashboardCard(
          child: AppText(
            'Error: ${statsState.error}',
            style: AppTextStyle.bodyMedium,
            color: AppColors.error,
          ),
        ),
      );
    }

    final statsSummary = statsState.data;
    final successfulRuns = statsSummary?.successfulRuns ?? 0;
    final failedRuns = statsSummary?.failedRuns ?? 0;
    final todayTasks = statsSummary?.todayTasks ?? 0;
    final successRate = statsSummary?.successRate ?? 0.0;
    final successRatePct = '${(successRate * 100).toStringAsFixed(0)}%';

    final stats = [
      (
        label: 'Successful Runs',
        value: successfulRuns.toString(),
        icon: Icons.check_circle_outline_rounded
      ),
      (
        label: 'Failed Runs',
        value: failedRuns.toString(),
        icon: Icons.error_outline_rounded
      ),
      (
        label: 'Today\'s Tasks',
        value: todayTasks.toString(),
        icon: Icons.today_rounded
      ),
      (
        label: 'Success Rate',
        value: successRatePct,
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
