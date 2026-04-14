import 'package:flutter/material.dart';
import 'package:my_web_page/data/sources/projects_list.dart';
import 'package:my_web_page/presentation/personal_projects_section/project_card.dart';
import '../section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          const SectionHeader(title: 'Personal Projects'),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isSingleRow = constraints.maxWidth > 750;

              if (isSingleRow) {
                return IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: projectsList.map((project) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ProjectCard(
                        project: project,
                      ),
                    )).toList(),
                  ),
                );
              }

              return Column(
                children: projectsList.map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ProjectCard(
                    project: project,
                  ),
                )).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}