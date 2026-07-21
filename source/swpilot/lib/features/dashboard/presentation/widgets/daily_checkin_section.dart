import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/daily_checkin/daily_checkin.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/daily_checkin_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DailyCheckinSection extends ConsumerWidget {
  const DailyCheckinSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkInState = ref.watch(dailyCheckInControllerProvider);

    if (checkInState.isLoading) {
      return const DashboardSection(
        title: 'Daily Check-in',
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

    if (checkInState.error != null) {
      return DashboardSection(
        title: 'Daily Check-in',
        child: DashboardCard(
          child: AppText(
            'Error: ${checkInState.error}',
            style: AppTextStyle.bodyMedium,
            color: AppColors.error,
          ),
        ),
      );
    }

    final checkIns = checkInState.data ?? [];

    return DashboardSection(
      title: 'Daily Check-in',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: checkIns.map((checkIn) {
          String statusString;
          switch (checkIn.status) {
            case DailyCheckInStatus.completed:
              statusString = 'Completed';
              break;
            case DailyCheckInStatus.failed:
              statusString = 'Failed';
              break;
            case DailyCheckInStatus.pending:
              statusString = 'Pending';
              break;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: DailyCheckInCard(
              gameName: checkIn.gameName,
              initials: checkIn.initials,
              status: statusString,
            ),
          );
        }).toList(),
      ),
    );
  }
}
