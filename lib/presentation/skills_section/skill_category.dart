import 'package:flutter/material.dart';
import '../colors.dart';

class SkillCategory extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? assetPath;
  final List<String> skills;

  const SkillCategory({
    super.key,
    required this.title,
    this.icon,
    this.assetPath,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (assetPath != null)
                Image.asset(
                  assetPath!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                )
              else if (icon != null)
                Icon(icon, color: _getIconColor()),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                    side: BorderSide(
                      color: Colors.blueAccent.withValues(alpha: 0.2),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Color _getIconColor() {
    if (title == 'Android') return AppColors.androidGreen;
    if (title == 'Firebase') return AppColors.firebaseOrange;
    return Colors.blueAccent;
  }
}
