import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/contact_section/contact_section.dart';
import 'infrastructure/services/url_launcher_service.dart';

void main() {
  runApp(MyPortfolio(
  ));
}

class MyPortfolio extends StatelessWidget {

  const MyPortfolio({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rostyslav Triodial | Flutter && Android Developer ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: HomePage(

      ),
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({
    super.key
  });

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
              ProjectsSection(
              ),
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

class StatisticsBar extends StatelessWidget {
  const StatisticsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(value: '4+ года', label: 'Опыта'),
          _StatItem(value: '10+', label: 'Проектов'),
          _StatItem(value: 'B2+', label: 'English'),
          _StatItem(value: 'Master', label: 'Degree'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white54)),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          SectionHeader(title: 'Опыт работы'),
          SizedBox(height: 30),
          _ExpTile(
            company: 'PSN',
            role: 'Mobile Developer (Dart, Kotlin)',
            period: '1 год',
            desc: 'Разработка приложения для менеджеров по туризму. Передача медиафайлов на сервер, работа с API.',
          ),
          _ExpTile(
            company: 'Initium Group',
            role: 'Android Developer (Kotlin/Java)',
            period: '2.7 года',
            desc: 'Разработка Android-приложений для арбитража. Reverse Engineering мобильных приложений.',
          ),
          _ExpTile(
            company: 'YELLOWS Software House',
            role: 'Android Developer (Intern)',
            period: '3 месяца',
            desc: 'Разработка YeMath (детская игра) и ПО для складских сканеров MC9300.',
          ),
        ],
      ),
    );
  }
}

class _ExpTile extends StatelessWidget {
  final String company;
  final String role;
  final String period;
  final String desc;

  const _ExpTile({required this.company, required this.role, required this.period, required this.desc});

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
          const Icon(Icons.business_center, color: Colors.blueAccent),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(role, style: const TextStyle(color: Colors.blueAccent)),
                const SizedBox(height: 5),
                Text(desc, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Text(period, style: const TextStyle(color: Colors.white38)),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {

  const ProjectsSection({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black26,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          const SectionHeader(title: 'Собственные проекты'),
          const SizedBox(height: 40),
          // Wrap(
          //   spacing: 20,
          //   runSpacing: 20,
          //   alignment: WrapAlignment.center,
          //   children: projects.map((project) => _ProjectCard(
          //     title: project.title,
          //     desc: project.description,
          //     url: project.url,
          //     icon: project.icon,
          //     onOpen: openLink,
          //   )).toList(),
          // ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final String url;
  final IconData icon;
  final Future<void> Function(String) onOpen;

  const _ProjectCard({
    required this.title,
    required this.desc,
    required this.url,
    required this.icon,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          const SizedBox(height: 15),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => onOpen(url),
            child: const Text('Смотреть в Google Play'),
          ),
        ],
      ),
    );
  }
}

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          SectionHeader(title: 'Технологии'),
          SizedBox(height: 30),
          _SkillCategory(title: 'Android Native', skills: ['Kotlin', 'Java', 'Jetpack Compose', 'Dagger/Hilt', 'Room', 'Retrofit']),
          _SkillCategory(title: 'Flutter', skills: ['Dart', 'BLoC', 'Dio', 'SQFlite', 'Google Maps API', 'Platform Channels']),
          _SkillCategory(title: 'Инструменты', skills: ['Firebase', 'Git', 'Charles', 'Postman', 'Appium', 'Reverse Engineering']),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  const _SkillCategory({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: skills.map((s) => Chip(label: Text(s), backgroundColor: Colors.white10)).toList(),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white.withOpacity(0.02),
      padding: const EdgeInsets.all(40),
      child: const Column(
        children: [
          SectionHeader(title: 'Образование'),
          SizedBox(height: 30),
          _EduTile(title: 'Master: Mobile Application Development', sub: 'Vistula University, Poland (2020-2022)'),
          _EduTile(title: 'Bachelor: Automation & Computer Technologies', sub: 'NTUU "KPI", Ukraine (2016-2020)'),
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
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          Text(sub, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hobbies = {
      'Пчеловодство': Icons.bug_report,
      'Археология': Icons.terrain,
      'Аэрофотосъемка': Icons.settings_input_antenna,
      'Консервация артефактов': Icons.inventory,
    };
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          const SectionHeader(title: 'Вне работы'),
          const SizedBox(height: 30),
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: hobbies.entries.map((e) => Column(
              children: [
                Icon(e.value, size: 40, color: Colors.blueAccent),
                const SizedBox(height: 8),
                Text(e.key),
              ],
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(width: 60, height: 4, color: Colors.blueAccent),
      ],
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
