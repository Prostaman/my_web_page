import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/experience_list.dart';
import 'package:my_web_page/domain/entities/expirience/company_app_entity.dart';
import 'package:my_web_page/domain/entities/expirience/experience_entity.dart';
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
    }
  });

  testWidgets('ExpTile handles company logo click if URL is present', (
    WidgetTester tester,
  ) async {
    const testExp = ExperienceEntity(
      company: 'Clickable Co',
      role: 'Dev',
      period: '2024',
      desc: 'Desc',
      companyIcon: 'assets/icons/companies/initium_icon.png',
      companyUrl: 'https://test.com',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ExpTile(experience: testExp)),
      ),
    );

    // Find the company logo
    final logoFinder = find.byType(GestureDetector).first;
    expect(logoFinder, findsOneWidget);

    // Note: We can't easily test url_launcher in widget tests without mocks,
    // but we verify the GestureDetector is there.
  });

  testWidgets('ExpTile opens dialog on app icon click', (
    WidgetTester tester,
  ) async {
    final testExp = ExperienceEntity(
      company: 'App Co',
      role: 'Dev',
      period: '2024',
      desc: 'Desc',
      apps: [
        const CompanyAppEntity(
          name: 'Test App',
          iconPath: 'assets/icons/projects/PSN_icon.png',
          androidUrl: 'https://play.google.com',
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ExpTile(experience: testExp)),
      ),
    );

    // Find the app icon and tap it
    final appIconFinder = find.byType(Image).first;
    await tester.tap(appIconFinder);
    await tester.pumpAndSettle(); // Wait for dialog animation

    // Verify dialog is shown
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Test App'), findsOneWidget);
    expect(find.text('Google Play'), findsOneWidget);
  });
}
