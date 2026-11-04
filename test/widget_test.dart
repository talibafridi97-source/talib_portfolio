import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talib_portfolio/main.dart';
import 'package:talib_portfolio/theme/theme_provider.dart';

void main() {
  testWidgets('Portfolio loads smoke test', (WidgetTester tester) async {
    // Build our app with ThemeProvider and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const PortfolioApp(),
      ),
    );

    // Verify that Talib Nawaz is displayed.
    expect(find.textContaining('Talib Nawaz'), findsWidgets);
  });
}
