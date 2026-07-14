import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/activity_timeline_item.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/theme/app_spacing.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      (time: '07:00', description: 'Daily Check-in completed'),
      (time: '07:05', description: 'Reward claimed'),
      (time: '07:10', description: 'Scheduler initialized'),
      (time: '07:15', description: 'Automation waiting'),
      (time: '07:20', description: 'System ready'),
    ];

    return DashboardSection(
      title: 'Recent Activity',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: activities.map((activity) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: ActivityTimelineItem(
              time: activity.time,
              description: activity.description,
            ),
          );
        }).toList(),
      ),
    );
  }
}
