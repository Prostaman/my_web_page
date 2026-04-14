import 'package:flutter/material.dart';
import 'package:my_web_page/data/sources/experience_list.dart';

import '../section_header.dart';
import 'exp_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SectionHeader(title: 'Professional Experience'),
          const SizedBox(height: 30),
          ...experienceList.map((exp) => ExpTile(experience: exp)),
        ],
      ),
    );
  }
}
