import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_content.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:swpilot/theme/app_spacing.dart';

/// Main dashboard page.
///
/// Displays the primary overview of SWPilot.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardHeader(),
                SizedBox(height: AppSpacing.lg),
                DashboardContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

