import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notifications_none_rounded,
          size: AppSpacing.huge,
          color: AppColors.white.withValues(alpha: 0.3),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppText(
          'No notifications yet',
          style: AppTextStyle.bodyMedium,
          color: AppColors.white.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}
