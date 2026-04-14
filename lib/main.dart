import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/contact_section/contact_section.dart';
import 'package:my_web_page/presentation/education_section/education_section.dart';
import 'package:my_web_page/presentation/expierence_section/experience_section.dart';
import 'package:my_web_page/presentation/hobbies_section/hobbies_section.dart';
import 'package:my_web_page/presentation/personal_projects_section/projects_section.dart';
import 'package:my_web_page/presentation/skills_section/skills_grid.dart';
import 'package:my_web_page/presentation/statistics_bar/statistics_bar.dart';
import 'infrastructure/services/url_launcher_service.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rostyslav Triodial | Mobile Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ContactSection(onOpenLink: openLink),
              const StatisticsBar(),
              const ExperienceSection(),
              const ProjectsSection(),
              const SkillsGrid(),
              const EducationSection(),
              const HobbiesSection(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.black,
      width: double.infinity,
      child: const Text(
        '© 2026 Rostyslav Triodial. Built with Flutter for Web.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white38),
      ),
    );
  }
}
