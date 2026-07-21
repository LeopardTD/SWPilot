import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/schedule/schedule.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/schedule_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class ScheduleOverviewSection extends ConsumerWidget {
  const ScheduleOverviewSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleState = ref.watch(scheduleControllerProvider);

    if (scheduleState.isLoading) {
      return const DashboardSection(
        title: 'Schedule Overview',
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

    if (scheduleState.error != null) {
      return DashboardSection(
        title: 'Schedule Overview',
        child: DashboardCard(
          child: AppText(
            'Error: ${scheduleState.error}',
            style: AppTextStyle.bodyMedium,
            color: AppColors.error,
          ),
        ),
      );
    }

    final schedules = scheduleState.data ?? [];
    final dateFormat = DateFormat('HH:mm');

    return DashboardSection(
      title: 'Schedule Overview',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: schedules.isEmpty
            ? [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: AppSpacing.huge,
                          color: AppColors.white.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        AppText(
                          'No schedules available',
                          style: AppTextStyle.bodyMedium,
                          color: AppColors.white.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : schedules.map((schedule) {
                String statusString;
                switch (schedule.status) {
                  case ScheduleStatus.scheduled:
                    statusString = 'Scheduled';
                    break;
                  case ScheduleStatus.running:
                    statusString = 'Running';
                    break;
                  case ScheduleStatus.paused:
                    statusString = 'Paused';
                    break;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: ScheduleCard(
                    taskName: schedule.taskName,
                    nextRun: dateFormat.format(schedule.nextRun),
                    status: statusString,
                  ),
                );
              }).toList(),
      ),
    );
  }
}
