import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_web/app.dart';
import 'package:portfolio_web/main.dart';

void main() {
  testWidgets('Portfolio smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: PortfolioApp(),
      ),
    );

    // Verify that the brand name is present.
    expect(find.text('DEV.CORE'), findsOneWidget);
  });
}
