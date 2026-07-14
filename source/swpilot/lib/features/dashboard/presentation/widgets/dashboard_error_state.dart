import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

/// Used when dashboard failed to load data.
class DashboardErrorState extends StatelessWidget {
  const DashboardErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                'Something went wrong',
                style: AppTextStyle.titleMedium,
                color: AppColors.error,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              AppText(
                'Unable to load dashboard data.',
                style: AppTextStyle.bodyMedium,
                color: AppColors.white.withValues(alpha: 0.5),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
