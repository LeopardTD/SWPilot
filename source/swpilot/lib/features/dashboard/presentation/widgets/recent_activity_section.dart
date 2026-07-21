import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swpilot/features/dashboard/notifications/notifications.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/activity_timeline_item.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class RecentActivitySection extends ConsumerWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationControllerProvider);

    if (notificationState.isLoading) {
      return const DashboardSection(
        title: 'Recent Activity',
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

    if (notificationState.error != null) {
      return DashboardSection(
        title: 'Recent Activity',
        child: DashboardCard(
          child: AppText(
            'Error: ${notificationState.error}',
            style: AppTextStyle.bodyMedium,
            color: AppColors.error,
          ),
        ),
      );
    }

    final activities = notificationState.data ?? [];
    final dateFormat = DateFormat('HH:mm');

    return DashboardSection(
      title: 'Recent Activity',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: activities.isEmpty
            ? [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history_rounded,
                          size: AppSpacing.huge,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        AppText(
                          'No recent activity',
                          style: AppTextStyle.bodyMedium,
                          color: AppColors.white.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : activities.map((activity) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: ActivityTimelineItem(
                    time: dateFormat.format(activity.timestamp),
                    description: activity.message,
                  ),
                );
              }).toList(),
      ),
    );
  }
}
