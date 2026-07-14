import 'package:flutter/material.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/automation_status_card.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_section.dart';

class AutomationStatusSection extends StatelessWidget {
  const AutomationStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardSection(
      title: 'Automation Status',
      child: AutomationStatusCard(),
    );
  }
}
