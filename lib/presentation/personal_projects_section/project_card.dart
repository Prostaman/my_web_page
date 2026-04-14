import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/colors.dart';
import '../../domain/entities/project_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _buildProjectIcon(),
          const SizedBox(height: 15),
          Text(
            project.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: Text(
              project.description,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ), // Возвращаем Spacer, так как на десктопе он нужен для выравнивания
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (project.androidUrl != null)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.android),
                  onPressed: () => openLink(project.androidUrl!),
                  color: AppColors.androidGreen,
                  tooltip: 'Google Play',
                ),
              if (project.iosUrl != null) ...[
                const SizedBox(width: 15),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.apple),
                  onPressed: () => openLink(project.iosUrl!),
                  color: Colors.white,
                  tooltip: 'App Store',
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectIcon() {
    if (project.assetPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          project.assetPath!,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      );
    }
    return Icon(project.icon, size: 40, color: Colors.blueAccent);
  }
}
