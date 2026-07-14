import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/daily_checkin_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DailyCheckinSection extends StatelessWidget {
  const DailyCheckinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardSection(
      title: 'Daily Check-in',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DailyCheckInCard(
            gameName: 'Genshin Impact',
            initials: 'GI',
            status: 'Pending',
          ),
          SizedBox(height: AppSpacing.sm),
          DailyCheckInCard(
            gameName: 'Honkai: Star Rail',
            initials: 'HSR',
            status: 'Pending',
          ),
          SizedBox(height: AppSpacing.sm),
          DailyCheckInCard(
            gameName: 'Zenless Zone Zero',
            initials: 'ZZZ',
            status: 'Pending',
          ),
        ],
      ),
    );
  }
}
