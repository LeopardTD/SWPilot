import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.type,
    required this.message,
    required this.timestamp,
    super.key,
  });

  final String type;
  final String message;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;
    switch (type.toLowerCase()) {
      case 'success':
        indicatorColor = AppColors.cyan;
        break;
      case 'reminder':
        indicatorColor = AppColors.primaryPurple;
        break;
      default:
        indicatorColor = AppColors.white.withValues(alpha: 0.6);
    }

    return Semantics(
      label: 'Notification [$type] at $timestamp: $message',
      child: DashboardCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: AppSpacing.xs,
                        height: AppSpacing.xs,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Flexible(
                        child: AppText(
                          type,
                          style: AppTextStyle.labelMedium,
                          color: indicatorColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                AppText(
                  timestamp,
                  style: AppTextStyle.labelSmall,
                  color: AppColors.white.withValues(alpha: 0.5),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            AppText(
              message,
              style: AppTextStyle.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
