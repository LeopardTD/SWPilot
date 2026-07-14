import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/quick_action_card.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (title: 'Daily Check-in', icon: Icons.bolt_rounded),
      (title: 'Scheduler', icon: Icons.calendar_today_rounded),
      (title: 'Statistics', icon: Icons.bar_chart_rounded),
      (title: 'Notifications', icon: Icons.notifications_rounded),
    ];

    return DashboardSection(
      title: 'Quick Actions',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
          final childAspectRatio = constraints.maxWidth > 600 ? 1.5 : 1.2;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: actions.length,
            itemBuilder: (context, index) {
              final action = actions[index];
              return QuickActionCard(
                title: action.title,
                icon: Icon(
                  action.icon,
                  color: AppColors.cyan,
                  size: AppSpacing.xl,
                ),
                onTap: () {
                  // Placeholder callback
                },
              );
            },
          );
        },
      ),
    );
  }
}
