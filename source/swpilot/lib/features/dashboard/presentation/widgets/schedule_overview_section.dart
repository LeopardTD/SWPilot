import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/schedule_card.dart';
import 'package:swpilot/theme/app_spacing.dart';

class ScheduleOverviewSection extends StatelessWidget {
  const ScheduleOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardSection(
      title: 'Schedule Overview',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScheduleCard(
            taskName: 'Daily Check-in',
            nextRun: '07:00',
            status: 'Scheduled',
          ),
          SizedBox(height: AppSpacing.sm),
          ScheduleCard(
            taskName: 'Claim Rewards',
            nextRun: '07:05',
            status: 'Scheduled',
          ),
          SizedBox(height: AppSpacing.sm),
          ScheduleCard(
            taskName: 'Refresh Notes',
            nextRun: '07:10',
            status: 'Scheduled',
          ),
        ],
      ),
    );
  }
}
