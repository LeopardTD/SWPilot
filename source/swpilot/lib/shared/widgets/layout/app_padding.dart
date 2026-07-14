import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}
