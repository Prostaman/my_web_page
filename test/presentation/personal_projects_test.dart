import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/projects_list.dart';
import 'package:my_web_page/domain/entities/project_entity.dart';
import 'package:my_web_page/presentation/personal_projects_section/projects_section.dart';
import 'package:my_web_page/presentation/personal_projects_section/flip_project_card.dart';

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
    }
  });

  testWidgets('FlipProjectCard shows back side on hover', (
    WidgetTester tester,
  ) async {
    const testProject = ProjectEntity(
      title: 'Test App',
      description: 'Test Description',
      assetPath: 'assets/icons/projects/deutsche_verben_b2_icon.png',
      androidUrl: 'https://play.google.com',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: FlipProjectCard(project: testProject)),
        ),
      ),
    );

    // Front side should be visible
    expect(find.text('Test App'), findsOneWidget);
    expect(find.text('Check it out on:'), findsNothing);

    // Simulate mouse hover
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);

    await gesture.moveTo(tester.getCenter(find.byType(FlipProjectCard)));
    await tester.pump(); // Start animation
    await tester.pumpAndSettle(); // Finish animation

    // Back side should be visible now
    expect(find.text('Check it out on:'), findsOneWidget);
    expect(find.text('Google Play'), findsOneWidget);
  });
}
