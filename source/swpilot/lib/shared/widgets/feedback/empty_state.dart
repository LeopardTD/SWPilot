import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_button.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/theme/app_text_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    required this.description,
    super.key,
    this.icon,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String description;
  final Widget? icon;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(
                    color: AppColors.cyan,
                    size: 48.0,
                  ),
                ),
                child: icon!,
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            Text(
              title,
              style: AppTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              description,
              style: AppTextTheme.bodyMedium.copyWith(
                color: AppColors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onActionPressed != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(text: actionLabel!, onPressed: onActionPressed),
            ],
          ],
        ),
      ),
    );
  }
}
