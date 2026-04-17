import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/projects_list.dart';
import 'package:my_web_page/domain/entities/project_entity.dart';
import 'package:my_web_page/presentation/personal_projects_section/projects_section.dart';
import 'package:my_web_page/presentation/personal_projects_section/project_card.dart';

void main() {
  testWidgets('ProjectsSection displays all items from projectsList', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: ProjectsSection())),
      ),
    );

    expect(find.text('Personal Projects'), findsOneWidget);

    for (var project in projectsList) {
      expect(find.text(project.title), findsOneWidget);
      expect(find.text(project.description), findsOneWidget);
    }
  });

  testWidgets('ProjectCard renders correctly with isolated data', (
    WidgetTester tester,
  ) async {
    const testProject = ProjectEntity(
      title: 'Test App',
      description: 'Test Description',
      assetPath: 'assets/icons/projects/deutsche_verben_b2_icon.png',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ProjectCard(project: testProject)),
      ),
    );

    expect(find.text('Test App'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);

    final imageFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == testProject.assetPath,
    );
    expect(imageFinder, findsOneWidget);
  });
}
