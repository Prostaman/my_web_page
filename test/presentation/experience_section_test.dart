import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/experience_list.dart';
import 'package:my_web_page/domain/entities/experience_entity.dart';
import 'package:my_web_page/presentation/expierence_section/exp_tile.dart';
import 'package:my_web_page/presentation/expierence_section/experience_section.dart';

void main() {
  testWidgets('ExperienceSection displays all items from experienceList', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: ExperienceSection())),
      ),
    );

    expect(find.text('Professional Experience'), findsOneWidget);

    for (var exp in experienceList) {
      expect(find.text(exp.company), findsOneWidget);
      expect(find.text(exp.role), findsOneWidget);
      expect(find.text(exp.period), findsOneWidget);
    }
  });

  testWidgets('ExpTile renders correctly with isolated data', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ExpTile(
            experience: ExperienceEntity(
              company: 'Test Company',
              role: 'Senior Developer',
              period: '2023 - Present',
              desc: 'Developed amazing things.',
              companyIcon: 'assets/icons/companies/initium_icon.png',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Company'), findsOneWidget);
    expect(find.text('Senior Developer'), findsOneWidget);
    expect(find.text('2023 - Present'), findsOneWidget);
    expect(find.textContaining('Developed amazing things'), findsOneWidget);

    // Verify icon
    final iconFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              'assets/icons/companies/initium_icon.png',
    );
    expect(iconFinder, findsOneWidget);
  });
}
