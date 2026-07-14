import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/notification_item.dart';
import 'package:swpilot/theme/app_spacing.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardSection(
      title: 'Notifications',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotificationItem(
            type: 'Information',
            message: 'Automation Engine initialized',
            timestamp: '07:00',
          ),
          SizedBox(height: AppSpacing.sm),
          NotificationItem(
            type: 'Success',
            message: 'Daily Check-in completed',
            timestamp: '07:01',
          ),
          SizedBox(height: AppSpacing.sm),
          NotificationItem(
            type: 'Reminder',
            message: 'Next automation scheduled',
            timestamp: '07:05',
          ),
          SizedBox(height: AppSpacing.sm),
          NotificationItem(
            type: 'Information',
            message: 'SWPilot is ready',
            timestamp: '07:06',
          ),
        ],
      ),
    );
  }
}
