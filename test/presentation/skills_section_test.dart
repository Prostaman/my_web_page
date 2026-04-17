import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/skills_list.dart';
import 'package:my_web_page/presentation/skills_section/skills_grid.dart';
import 'package:my_web_page/presentation/skills_section/skill_category.dart';

void main() {
  testWidgets('SkillsGrid displays all categories from skillsList', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: SkillsGrid())),
      ),
    );

    expect(find.text('Technical Skills'), findsOneWidget);

    for (var skill in skillsList) {
      expect(find.text(skill.title), findsOneWidget);
    }
  });

  testWidgets('SkillCategory renders correctly with isolated data', (
    WidgetTester tester,
  ) async {
    const testSkills = ['Flutter', 'Dart', 'Testing'];

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SkillCategory(
            title: 'Cross-Platform',
            icon: Icons.star,
            skills: testSkills,
          ),
        ),
      ),
    );

    expect(find.text('Cross-Platform'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);

    for (var skill in testSkills) {
      expect(find.text(skill), findsOneWidget);
    }
  });
}
