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
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade900, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.blueAccent,
            //child: Image.asset('assets/images/mein_photo.png'),
            backgroundImage: AssetImage('assets/images/mein_foto.png'),
          ),
          const SizedBox(height: 24),
          const Text(
            'Rostyslav Triodial',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Flutter(Mobile+Web) && Android Developer',
            style: TextStyle(
              fontSize: 22,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Germany, Bayern, 92253 Schnaittenbach | Experience 4+ years',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: contactLinksList.map((link) {
              return SocialButton(link: link, onOpenLink: onOpenLink);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
