import 'package:flutter/material.dart';
import '../../data/sources/hobbies_list.dart';
import '../section_header.dart';

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SectionHeader(title: 'Hobbies & Interests'),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: hobbiesList.map((hobby) => _HobbyCard(name: hobby.name, icon: hobby.icon)).toList(),
          ),
        ],
      ),
    );
  }
}

class _HobbyCard extends StatelessWidget {
  final String name;
  final IconData icon;
  const _HobbyCard({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.blueAccent),
          const SizedBox(height: 10),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
