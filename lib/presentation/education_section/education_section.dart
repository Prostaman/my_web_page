import 'package:flutter/material.dart';
import '../../data/sources/education_list.dart';
import '../section_header.dart';

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
          const SizedBox(height: 30),
          ...educationList.map((edu) => _EduTile(title: edu.title, sub: edu.sub)),
        ],
      ),
    );
  }
}

class _EduTile extends StatelessWidget {
  final String title;
  final String sub;
  const _EduTile({required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Text(sub, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
