import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_spacing.dart';
import 'package:swpilot/theme/app_text_theme.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    required this.title,
    required this.child,
    super.key,
    this.subtitle,
    this.spacing = AppSpacing.md,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextTheme.titleLarge),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(
            subtitle!,
            style: AppTextTheme.bodySmall.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
