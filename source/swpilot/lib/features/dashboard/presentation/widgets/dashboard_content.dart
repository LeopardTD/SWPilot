import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/automation_status_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/daily_checkin_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/notification_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/quick_actions_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/recent_activity_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/schedule_overview_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/statistics_summary_section.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuickActionsSection(),
        SizedBox(height: AppSpacing.xl),
        AutomationStatusSection(),
        SizedBox(height: AppSpacing.xl),
        DailyCheckinSection(),
        SizedBox(height: AppSpacing.xl),
        ScheduleOverviewSection(),
        SizedBox(height: AppSpacing.xl),
        StatisticsSummarySection(),
        SizedBox(height: AppSpacing.xl),
        RecentActivitySection(),
        SizedBox(height: AppSpacing.xl),
        NotificationSection(),
        SizedBox(height: AppSpacing.xl),
        AppText(
          'Coming Soon',
          style: AppTextStyle.bodyMedium,
        ),
      ],
    );
  }
}
