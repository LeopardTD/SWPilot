import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swpilot/features/dashboard/automation_status/automation_status.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_divider.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AutomationStatusCard extends ConsumerWidget {
  const AutomationStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusState = ref.watch(automationStatusControllerProvider);

    if (statusState.isLoading) {
      return const DashboardCard(
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

    if (statusState.error != null) {
      return DashboardCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              'Automation Engine',
              style: AppTextStyle.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppDivider(),
            const SizedBox(height: AppSpacing.md),
            AppText(
              'Error: ${statusState.error}',
              style: AppTextStyle.bodyMedium,
              color: AppColors.error,
            ),
          ],
        ),
      );
    }

    final status = statusState.data;
    final isActive = status?.isActive ?? false;
    final lastExecution = status?.lastExecution;
    final nextSchedule = status?.nextSchedule;

    final dateFormat = DateFormat('HH:mm');
    final lastExecutionStr = lastExecution != null ? dateFormat.format(lastExecution) : '--';
    final nextScheduleStr = nextSchedule != null ? dateFormat.format(nextSchedule) : '--';

    final statusText = isActive ? 'Active' : 'Inactive';
    final statusColor = isActive ? AppColors.cyan : AppColors.white.withValues(alpha: 0.5);

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
                      statusText,
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
                      AppText(
                        lastExecutionStr,
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
                      AppText(
                        nextScheduleStr,
                        style: AppTextStyle.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
