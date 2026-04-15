import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/presentation/expierence_section/experience_section.dart';

void main() {
  testWidgets('ExperienceSection displays professional history', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: ExperienceSection(),
          ),
        ),
      ),
    );

    // Проверяем заголовок
    expect(find.text('Professional Experience'), findsOneWidget);

    // Проверяем компании из нашего списка
    expect(find.text('Poihaly z namy'), findsOneWidget);
    expect(find.text('Initium Group'), findsOneWidget);
    expect(find.text('YELLOWS Software House'), findsOneWidget);

    // Проверяем наличие ролей
    expect(find.textContaining('Mobile Developer'), findsWidgets);
    expect(find.textContaining('Android Developer'), findsWidgets);
  });
}
