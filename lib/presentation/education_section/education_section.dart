import 'package:flutter/material.dart';
import '../../data/sources/education_list.dart';
import '../section_header.dart';
import 'education_tile.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white.withOpacity(0.02),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SectionHeader(title: 'Education'),
          const SizedBox(height: 50),
          Wrap(
            spacing: 100, // Horizontal space between cards
            runSpacing: 60, // Vertical space if wrapped
            alignment: WrapAlignment.center,
            children: educationList
                .map((edu) => EduTile(
                      degree: edu.degree,
                      title: edu.specialization,
                      sub: edu.sub,
                      iconPath: edu.iconPath,
                      isCircle: edu.isCircle,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}


