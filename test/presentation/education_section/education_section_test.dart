import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_web_page/data/sources/education_list.dart';
import 'package:my_web_page/presentation/education_section/education_section.dart';

void main() {
  testWidgets('EducationSection displays all items and icons from educationList', (WidgetTester tester) async {
    // Отрисовываем виджет
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: EducationSection(),
          ),
        ),
      ),
    );

    // 1. Проверяем наличие основного заголовка секции
    expect(find.text('Education'), findsOneWidget);

    // 2. Проходим циклом по всем данным из educationList
    for (var edu in educationList) {
      // Проверяем текст (степень, специальность, вуз)
      expect(find.textContaining(edu.degree.toUpperCase()), findsOneWidget);
      expect(find.textContaining(edu.specialization), findsOneWidget);
      expect(find.text(edu.sub), findsOneWidget);

      // 3. Проверяем наличие иконки по пути к ассету
      if (edu.iconPath != null) {
        if (edu.iconPath!.endsWith('.svg')) {
          // Для SVG: ищем виджет SvgPicture с нужным assetName
          final svgFinder = find.byWidgetPredicate((widget) =>
              widget is SvgPicture &&
              widget.bytesLoader is SvgAssetLoader &&
              (widget.bytesLoader as SvgAssetLoader).assetName == edu.iconPath);
          expect(svgFinder, findsOneWidget);
        } else {
          // Для обычных картинок: ищем Image.asset
          final imageFinder = find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == edu.iconPath);
          expect(imageFinder, findsOneWidget);
        }
      }
    }
  });
}
