import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_radius.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.showBorder = false,
    this.elevation = 0.0,
    this.backgroundColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool showBorder;
  final double elevation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? AppColors.surface,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.md,
        side: showBorder
            ? BorderSide(
                color: AppColors.primaryPurple.withValues(alpha: 0.2),
                width: 1.0,
              )
            : BorderSide.none,
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
