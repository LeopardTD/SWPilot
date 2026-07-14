import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_card.dart';
import 'package:swpilot/theme/app_spacing.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.backgroundColor,
    this.showBorder = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding,
      backgroundColor: backgroundColor,
      showBorder: showBorder,
      child: child,
    );
  }
}
