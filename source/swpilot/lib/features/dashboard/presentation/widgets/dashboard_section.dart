import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section_header.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    required this.title,
    required this.child,
    this.subtitle,
    this.spacing = AppSpacing.md,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        DashboardSectionHeader(
          title: title,
          subtitle: subtitle,
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
