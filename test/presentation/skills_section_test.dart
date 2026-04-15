import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/presentation/skills_section/skills_grid.dart';

void main() {
  testWidgets('SkillsGrid displays categories and specific skills', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SkillsGrid(),
          ),
        ),
      ),
    );

    // Проверяем наличие заголовка
    expect(find.text('Tech Stack'), findsOneWidget);

    // Проверяем наличие категорий
    expect(find.text('Mobile Development'), findsOneWidget);
    expect(find.text('Backend & Database'), findsOneWidget);

    // Проверяем конкретные навыки
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Android'), findsOneWidget);
  });
}
