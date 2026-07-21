import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/app/app.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/providers.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_empty_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_error_state.dart';
import 'package:swpilot/features/dashboard/presentation/widgets/dashboard_loading_state.dart';

/// Implementasi Mock untuk pengujian widget.
class MockDashboardRepository implements DashboardRepository {
  final DashboardSummary summary;

  MockDashboardRepository(this.summary);

  @override
  Future<DashboardSummary> getDashboardSummary() async => summary;

  @override
  Future<AutomationStatus> getAutomationStatus() async => summary.automationStatus;

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() async => summary.dailyCheckIns;

  @override
  Future<StatisticsSummary> getStatisticsSummary() async => summary.statisticsSummary;

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() async => summary.scheduleSummaries;

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() async => summary.notifications;

  @override
  Future<DashboardSummary> refreshDashboard() async => summary;
}

void main() {
  testWidgets('SWPilot Splash Screen smoke and navigation test', (
    WidgetTester tester,
  ) async {
    final dummySummary = DashboardSummary(
      automationStatus: const AutomationStatus(
        isActive: false,
      ),
      dailyCheckIns: const [
        DailyCheckIn(
          gameName: 'Genshin Impact',
          initials: 'GI',
          status: DailyCheckInStatus.pending,
        ),
        DailyCheckIn(
          gameName: 'Honkai: Star Rail',
          initials: 'HSR',
          status: DailyCheckInStatus.pending,
        ),
        DailyCheckIn(
          gameName: 'Zenless Zone Zero',
          initials: 'ZZZ',
          status: DailyCheckInStatus.pending,
        ),
      ],
      scheduleSummaries: [
        ScheduleSummary(
          taskName: 'Daily Check-in',
          nextRun: DateTime(2026, 7, 21, 7, 0),
          status: ScheduleStatus.scheduled,
        ),
        ScheduleSummary(
          taskName: 'Claim Rewards',
          nextRun: DateTime(2026, 7, 21, 7, 5),
          status: ScheduleStatus.scheduled,
        ),
        ScheduleSummary(
          taskName: 'Refresh Notes',
          nextRun: DateTime(2026, 7, 21, 7, 10),
          status: ScheduleStatus.scheduled,
        ),
      ],
      statisticsSummary: const StatisticsSummary(
        successfulRuns: 0,
        failedRuns: 0,
        todayTasks: 0,
        successRate: 0.0,
      ),
      notifications: [
        NotificationSummary(
          type: NotificationType.information,
          message: 'Automation Engine initialized',
          timestamp: DateTime(2026, 7, 21, 7, 0),
        ),
        NotificationSummary(
          type: NotificationType.success,
          message: 'Daily Check-in completed',
          timestamp: DateTime(2026, 7, 21, 7, 1),
        ),
        NotificationSummary(
          type: NotificationType.reminder,
          message: 'Next automation scheduled',
          timestamp: DateTime(2026, 7, 21, 7, 5),
        ),
        NotificationSummary(
          type: NotificationType.information,
          message: 'SWPilot is ready',
          timestamp: DateTime(2026, 7, 21, 7, 6),
        ),
        NotificationSummary(
          type: NotificationType.information,
          message: 'Reward claimed',
          timestamp: DateTime(2026, 7, 21, 7, 5),
        ),
        NotificationSummary(
          type: NotificationType.information,
          message: 'Scheduler initialized',
          timestamp: DateTime(2026, 7, 21, 7, 10),
        ),
        NotificationSummary(
          type: NotificationType.information,
          message: 'Automation waiting',
          timestamp: DateTime(2026, 7, 21, 7, 15),
        ),
        NotificationSummary(
          type: NotificationType.information,
          message: 'System ready',
          timestamp: DateTime(2026, 7, 21, 7, 20),
        ),
      ],
    );

    final mockRepository = MockDashboardRepository(dummySummary);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          dashboardRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: const App(),
      ),
    );

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
    expect(find.text('07:05'), findsNWidgets(5));
    expect(find.text('07:10'), findsNWidgets(3));
    expect(find.text('Statistics Summary'), findsOneWidget);
    expect(find.text('Successful Runs'), findsOneWidget);
    expect(find.text('Failed Runs'), findsOneWidget);
    expect(find.text('Today\'s Tasks'), findsOneWidget);
    expect(find.text('Success Rate'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('0%'), findsOneWidget);
    expect(find.text('Recent Activity'), findsOneWidget);
    expect(find.text('Daily Check-in completed'), findsNWidgets(2));
    expect(find.text('Reward claimed'), findsNWidgets(2));
    expect(find.text('Scheduler initialized'), findsNWidgets(2));
    expect(find.text('Automation waiting'), findsNWidgets(2));
    expect(find.text('System ready'), findsNWidgets(2));
    expect(find.text('07:15'), findsNWidgets(2));
    expect(find.text('07:20'), findsNWidgets(2));
    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Reminder'), findsOneWidget);
    expect(find.text('Information'), findsNWidgets(6));
    expect(find.text('Automation Engine initialized'), findsNWidgets(2));
    expect(find.text('Next automation scheduled'), findsNWidgets(2));
    expect(find.text('SWPilot is ready'), findsNWidgets(2));
    expect(find.text('07:01'), findsNWidgets(2));
    expect(find.text('07:06'), findsNWidgets(2));
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
