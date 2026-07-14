import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DashboardSectionHeader extends StatelessWidget {
  const DashboardSectionHeader({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          title,
          style: AppTextStyle.titleLarge,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xxs),
          AppText(
            subtitle!,
            style: AppTextStyle.bodySmall,
            color: AppColors.white.withValues(alpha: 0.6),
          ),
        ],
      ],
    );
  }
}
