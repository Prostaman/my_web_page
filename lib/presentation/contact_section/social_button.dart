import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/entities/contact_link_entity.dart';
import '../../domain/services/link_launcher.dart';

class SocialButton extends StatelessWidget {
  final ContactLinkEntity link;
  final OpenLink onOpenLink;

  const SocialButton({
    super.key,
    required this.link,
    required this.onOpenLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: _buildIcon(),
        onPressed: () => onOpenLink(link.url),
        tooltip: link.type.name,
        color: Colors.white70,
        hoverColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildIcon() {
    const double iconSize = 30;
    const Color iconColor = Colors.white70;

    switch (link.type) {
      case ContactLinkType.github:
        return SvgPicture.asset(
          'assets/icons/github_icon.svg',
          width: iconSize,
          height: iconSize,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      case ContactLinkType.whatsapp:
        return Image.asset(
          'assets/icons/whats_app_icon.png',
          width: iconSize,
          height: iconSize,
        );
      case ContactLinkType.telegram:
        return const Icon(Icons.telegram, size: iconSize, color: iconColor);
      case ContactLinkType.mail:
        return const Icon(Icons.mail, size: iconSize, color: iconColor);
    }
  }
}
