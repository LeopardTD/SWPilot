import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_outlined_button.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/theme/app_text_theme.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    required this.message,
    super.key,
    this.icon,
    this.onRetry,
    this.retryLabel = 'Retry',
  });

  final String message;
  final Widget? icon;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ??
                const Icon(
                  Icons.error_outline_rounded,
                  color: AppColors.error,
                  size: 48.0,
                ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'An Error Occurred',
              style: AppTextTheme.titleLarge.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: AppTextTheme.bodyMedium.copyWith(
                color: AppColors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppOutlinedButton(text: retryLabel, onPressed: onRetry!),
            ],
          ],
        ),
      ),
    );
  }
}
