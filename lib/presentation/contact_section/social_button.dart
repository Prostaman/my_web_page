import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/entities/contact_link_entity.dart';
import '../../domain/services/link_launcher.dart';

import '../github_icon.dart';

class SocialButton extends StatelessWidget {
  final ContactLinkEntity link;
  final OpenLink onOpenLink;

  const SocialButton({super.key, required this.link, required this.onOpenLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: _buildIcon(),
        onPressed: () => onOpenLink(link.url),
        tooltip: link.type.label, // Use label instead of name
        color: Colors.white70,
        hoverColor: Colors.blueAccent.withValues(alpha: 0.1),
      ),
    );
  }

  Widget _buildIcon() {
    const double iconSize = 30;

    final Widget icon = switch (link.type) {
      ContactLinkType.github => const GithubIcon(size: iconSize),
      ContactLinkType.whatsapp => SvgPicture.asset(
        'assets/icons/social/whats_app_icon.svg',
        width: iconSize,
        height: iconSize,
      ),
      ContactLinkType.telegram => const Icon(
        Icons.telegram,
        size: iconSize,
        color: Colors.blueAccent,
      ),
      ContactLinkType.email => const Icon(
        Icons.mail,
        size: iconSize,
        color: Colors.amber,
      ),
    };

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white38, // Grey background
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
