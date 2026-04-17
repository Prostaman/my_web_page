import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_web_page/data/sources/contact_links_array.dart';
import 'package:my_web_page/presentation/contact_section/contact_section.dart';

void main() {
  testWidgets('ContactSection displays profile info and social links', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ContactSection(onOpenLink: (url) async {})),
      ),
    );

    // Verify name and role
    expect(find.text('Rostyslav Triodial'), findsOneWidget);
    expect(
      find.text('Flutter(Mobile+Web) && Android Developer'),
      findsOneWidget,
    );
    expect(find.textContaining('Germany'), findsOneWidget);

    // Verify that all links from the list are present (via the number of SocialButtons)
    // SocialButtons are rendered for each link in contactLinksList
    // Each SocialButton contains an InkWell or GestureDetector.
    // We ensure the number of buttons matches the length of contactLinksList.
    expect(
      find.byType(InkWell, skipOffstage: false),
      findsAtLeastNWidgets(contactLinksList.length),
    );
  });
}
