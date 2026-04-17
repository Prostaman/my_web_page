import 'package:flutter/material.dart';
import '../../data/sources/skills_list.dart';
import '../section_header.dart';
import 'skill_category.dart';

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          const SectionHeader(title: 'Technical Skills'),
          const SizedBox(height: 40),
          ...skillsList.map(
            (category) => SkillCategory(
              title: category.title,
              icon: category.icon,
              assetPath: category.assetPath,
              skills: category.technologies,
            ),
          ),
        ],
      ),
    );
  }
}
