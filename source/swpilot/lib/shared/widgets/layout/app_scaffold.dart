import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/theme/app_spacing.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.useSafeArea = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry padding;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget currentBody = Padding(padding: padding, child: body);

    if (useSafeArea) {
      currentBody = SafeArea(child: currentBody);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBar,
      body: currentBody,
      floatingActionButton: floatingActionButton,
    );
  }
}
