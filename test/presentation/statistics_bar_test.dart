import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/presentation/statistics_bar/statistics_bar.dart';
import 'package:my_web_page/presentation/statistics_bar/stat_item.dart';

void main() {
  testWidgets('StatisticsBar displays all hardcoded stats', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: StatisticsBar())),
    );

    // Verify key indicators
    expect(find.text('Experience'), findsOneWidget);
    expect(find.text('Master'), findsOneWidget);
    expect(find.text('B2'), findsOneWidget);
  });

  testWidgets('StatItem renders correctly in isolation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatItem(value: '100%', label: 'Success'),
        ),
      ),
    );

    expect(find.text('100%'), findsOneWidget);
    expect(find.text('Success'), findsOneWidget);
  });
}
