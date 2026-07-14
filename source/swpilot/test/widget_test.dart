import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/app/app.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_empty_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_error_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_loading_state.dart';

void main() {
  testWidgets('SWPilot Splash Screen smoke and navigation test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    expect(find.text('SWPilot'), findsOneWidget);
    expect(find.text('Level 999 Daily Automation'), findsOneWidget);
    expect(find.text('SW'), findsOneWidget);
    expect(find.text('v1.0.0'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('SW'), findsOneWidget);
    expect(find.text('SWPilot'), findsOneWidget);
    expect(find.text('Level 999 Daily Automation'), findsOneWidget);
    expect(find.text('Quick Actions'), findsOneWidget);
    expect(find.text('Daily Check-in'), findsNWidgets(3));
    expect(find.text('Scheduler'), findsOneWidget);
    expect(find.text('Statistics'), findsOneWidget);
    expect(find.text('Notifications'), findsNWidgets(2));
    expect(find.text('Automation Status'), findsOneWidget);
    expect(find.text('Automation Engine'), findsOneWidget);
    expect(find.text('Inactive'), findsOneWidget);
    expect(find.text('Last Execution'), findsOneWidget);
    expect(find.text('Next Schedule'), findsOneWidget);
    expect(find.text('Genshin Impact'), findsOneWidget);
    expect(find.text('Honkai: Star Rail'), findsOneWidget);
    expect(find.text('Zenless Zone Zero'), findsOneWidget);
    expect(find.text('Pending'), findsNWidgets(3));
    expect(find.text('Schedule Overview'), findsOneWidget);
    expect(find.text('Claim Rewards'), findsOneWidget);
    expect(find.text('Refresh Notes'), findsOneWidget);
    expect(find.text('Scheduled'), findsNWidgets(3));
    expect(find.text('07:00'), findsNWidgets(3));
    expect(find.text('07:05'), findsNWidgets(3));
    expect(find.text('07:10'), findsNWidgets(2));
    expect(find.text('Statistics Summary'), findsOneWidget);
    expect(find.text('Successful Runs'), findsOneWidget);
    expect(find.text('Failed Runs'), findsOneWidget);
    expect(find.text('Today\'s Tasks'), findsOneWidget);
    expect(find.text('Success Rate'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('0%'), findsOneWidget);
    expect(find.text('Recent Activity'), findsOneWidget);
    expect(find.text('Daily Check-in completed'), findsNWidgets(2));
    expect(find.text('Reward claimed'), findsOneWidget);
    expect(find.text('Scheduler initialized'), findsOneWidget);
    expect(find.text('Automation waiting'), findsOneWidget);
    expect(find.text('System ready'), findsOneWidget);
    expect(find.text('07:15'), findsOneWidget);
    expect(find.text('07:20'), findsOneWidget);
    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Reminder'), findsOneWidget);
    expect(find.text('Information'), findsNWidgets(2));
    expect(find.text('Automation Engine initialized'), findsOneWidget);
    expect(find.text('Next automation scheduled'), findsOneWidget);
    expect(find.text('SWPilot is ready'), findsOneWidget);
    expect(find.text('07:01'), findsOneWidget);
    expect(find.text('07:06'), findsOneWidget);
    expect(find.text('Coming Soon'), findsOneWidget);
  });

  testWidgets('Dashboard UI States test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardLoadingState(),
        ),
      ),
    );
    expect(find.byType(DashboardLoadingState), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardEmptyState(),
        ),
      ),
    );
    expect(find.text('No data available'), findsOneWidget);
    expect(find.text('Data will appear here once available.'), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardErrorState(),
        ),
      ),
    );
    expect(find.text('Something went wrong'), findsOneWidget);
    expect(find.text('Unable to load dashboard data.'), findsOneWidget);
  });
}
