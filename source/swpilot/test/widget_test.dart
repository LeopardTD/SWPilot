import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/app/app.dart';

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

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Coming Soon'), findsOneWidget);
  });
}
