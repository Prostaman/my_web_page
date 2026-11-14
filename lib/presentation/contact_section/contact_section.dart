import 'package:flutter/material.dart';
import '../../data/sources/contact_links_array.dart';
import '../../domain/services/link_launcher.dart';
import 'social_button.dart';

class ContactSection extends StatelessWidget {
  final OpenLink onOpenLink;

  const ContactSection({super.key, required this.onOpenLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade900, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 680, maxHeight: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.12),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: 0.25),
                    blurRadius: 36,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/ich_1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Rostyslav Triodial',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter && Android Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Colors.white54,
                ),
                SizedBox(width: 6),
                Text(
                  'Germany, Bayern, 92253 Schnaittenbach',
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: contactLinksList.map((link) {
                return SocialButton(link: link, onOpenLink: onOpenLink);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
