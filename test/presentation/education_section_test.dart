import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_web_page/data/sources/education_list.dart';
import 'package:my_web_page/presentation/education_section/education_section.dart';
import 'package:my_web_page/presentation/education_section/education_tile.dart';

void main() {
  testWidgets('EducationSection displays all items and icons from educationList', (WidgetTester tester) async {
    // Render the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: EducationSection(),
          ),
        ),
      ),
    );

    // 1. Verify the main section title
    expect(find.text('Education'), findsOneWidget);

    // 2. Loop through all data in educationList
    for (var edu in educationList) {
      // Verify text (degree, specialization, university)
      expect(find.textContaining(edu.degree.toUpperCase()), findsOneWidget);
      expect(find.textContaining(edu.specialization), findsOneWidget);
      expect(find.text(edu.sub), findsOneWidget);

      // 3. Verify icon existence by asset path
      if (edu.iconPath != null) {
        if (edu.iconPath!.endsWith('.svg')) {
          // For SVG: find SvgPicture widget with the correct assetName
          final svgFinder = find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              widget.bytesLoader is SvgAssetLoader &&
              (widget.bytesLoader as SvgAssetLoader).assetName == edu.iconPath);
          expect(svgFinder, findsOneWidget);
        } else {
          // For regular images: find Image.asset
          final imageFinder = find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == edu.iconPath);
          expect(imageFinder, findsOneWidget);
        }
      }
    }
  });

  testWidgets('EduTile renders correctly with isolated synthetic data', (WidgetTester tester) async {
    // 1. Prepare isolated data
    const String testDegree = 'Bachelor of Science';
    const String testTitle = 'Quantum Computing';
    const String testSub = 'International Space University, 2025';

    // 2. Render specific EduTile widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EduTile(
            degree: testDegree,
            title: testTitle,
            sub: testSub,
            iconPath: null, // Check case without icon
            isCircle: false,
          ),
        ),
      ),
    );

    // 3. Verify text is displayed correctly (including toUpperCase for degree)
    expect(find.textContaining(testDegree.toUpperCase()), findsOneWidget);
    expect(find.textContaining(testTitle), findsOneWidget);
    expect(find.text(testSub), findsOneWidget);

    // 4. Verify icon is NOT rendered (since iconPath: null)
    expect(find.byType(Image), findsNothing);
    expect(find.byType(SvgPicture), findsNothing);
  });
}
