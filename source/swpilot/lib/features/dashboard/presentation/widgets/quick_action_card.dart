import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    required this.title,
    required this.icon,
    super.key,
    this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Quick Action: $title',
      enabled: onTap != null,
      child: Tooltip(
        message: 'Open $title',
        child: DashboardCard(
          padding: EdgeInsets.zero,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.md,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(height: AppSpacing.xs),
                  AppText(
                    title,
                    style: AppTextStyle.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
