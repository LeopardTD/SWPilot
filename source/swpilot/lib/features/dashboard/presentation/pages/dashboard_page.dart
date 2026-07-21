import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_empty_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_error_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_loading_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_content.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:swpilot/features/dashboard/presentation/state/state.dart';
import 'package:swpilot/theme/app_spacing.dart';

/// Halaman utama dashboard.
///
/// Menampilkan ringkasan informasi utama aplikasi SWPilot secara dinamis.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    Widget bodyWidget;
    if (dashboardState.isLoading) {
      bodyWidget = const DashboardLoadingState();
    } else if (dashboardState.error != null) {
      bodyWidget = const DashboardErrorState();
    } else if (dashboardState.data == null) {
      bodyWidget = const DashboardEmptyState();
    } else {
      bodyWidget = const DashboardContent();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(),
                const SizedBox(height: AppSpacing.lg),
                bodyWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
