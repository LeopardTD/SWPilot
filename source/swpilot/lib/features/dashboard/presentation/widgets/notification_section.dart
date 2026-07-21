import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/notifications/notifications.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/notification_empty_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/notification_item.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class NotificationSection extends ConsumerWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationControllerProvider);

    if (notificationState.isLoading) {
      return const DashboardSection(
        title: 'Notifications',
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
        title: 'Notifications',
        child: DashboardCard(
          child: AppText(
            'Error: ${notificationState.error}',
            style: AppTextStyle.bodyMedium,
            color: AppColors.error,
          ),
        ),
      );
    }

    final notifications = notificationState.data ?? [];
    final dateFormat = DateFormat('HH:mm');

    return DashboardSection(
      title: 'Notifications',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: notifications.isEmpty
            ? [const NotificationEmptyState()]
            : notifications.map((notif) {
                String typeString;
                switch (notif.type) {
                  case NotificationType.success:
                    typeString = 'Success';
                    break;
                  case NotificationType.reminder:
                    typeString = 'Reminder';
                    break;
                  case NotificationType.information:
                    typeString = 'Information';
                    break;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: NotificationItem(
                    type: typeString,
                    message: notif.message,
                    timestamp: dateFormat.format(notif.timestamp),
                  ),
                );
              }).toList(),
      ),
    );
  }
}
