import 'package:flutter/material.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';
import 'package:swpilot/shared/widgets/layout/app_scaffold.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText('Dashboard', style: AppTextStyle.headlineLarge),
            SizedBox(height: 8.0),
            AppText(
              'Coming Soon',
              style: AppTextStyle.bodyMedium,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
