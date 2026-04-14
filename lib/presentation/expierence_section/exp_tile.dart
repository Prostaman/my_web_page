import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/github_icon.dart';
import '../../infrastructure/services/url_launcher_service.dart';

import '../../domain/entities/experience_entity.dart';

class ExpTile extends StatelessWidget {
  final ExperienceEntity experience;

  const ExpTile({
    required this.experience,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                    if (experience.companyIcon != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  experience.companyIcon!,
                  fit: BoxFit.contain,
                ),
              ),
            )
          else
            const Icon(Icons.business_center,
                color: Colors.blueAccent, size: 48),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(experience.company,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    _buildLinks(),
                  ],
                ),
                Text(experience.role,
                    style: const TextStyle(color: Colors.blueAccent)),
                const SizedBox(height: 5),
                Text(experience.desc,
                    style: const TextStyle(color: Colors.white70)),
                if (experience.appIcons != null &&
                    experience.appIcons!.isNotEmpty) ...[
                  const SizedBox(height: 15),
                  Row(
                    children: experience.appIcons!
                        .map((iconPath) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child:
                                    Image.asset(iconPath, width: 40, height: 40),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 20),
          Text(experience.period,
              style: const TextStyle(color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildLinks() {
    const double sizeIcon = 20;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (experience.androidUrl != null)
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.android, size: sizeIcon),
            onPressed: () => openLink(experience.androidUrl!),
            tooltip: 'Google Play',
            color: const Color(0xFF3DDC84),
          ),
        if (experience.iosUrl != null) ...[
          const SizedBox(width: 8),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.apple, size: sizeIcon),
            onPressed: () => openLink(experience.iosUrl!),
            tooltip: 'App Store',
            color: Colors.white,
          ),
        ],
        if (experience.githubUrl != null) ...[
          const SizedBox(width: 8),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: GithubIcon(size: sizeIcon, color: Colors.white70),
            onPressed: () => openLink(experience.githubUrl!),
            tooltip: 'GitHub',
          ),
        ],
      ],
    );
  }
}