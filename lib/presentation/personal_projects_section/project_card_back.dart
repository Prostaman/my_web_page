import 'package:flutter/material.dart';
import '../../domain/entities/project_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';
import '../colors.dart';

class ProjectCardBack extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCardBack({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 280, // Высота должна совпадать с ProjectCard (280)
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.1),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Check it out!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (project.androidUrl != null)
            _buildLinkButton(
              icon: Icons.android,
              label: 'Google Play',
              color: AppColors.androidGreen,
              onTap: () => openLink(project.androidUrl!),
            ),
          if (project.androidUrl != null && project.iosUrl != null)
            const SizedBox(height: 15),
          if (project.iosUrl != null)
            _buildLinkButton(
              icon: Icons.apple,
              label: 'App Store',
              color: Colors.white,
              onTap: () => openLink(project.iosUrl!),
            ),
          if (project.androidUrl == null && project.iosUrl == null)
            const Text(
              'Links coming soon',
              style: TextStyle(color: Colors.white54),
            ),
        ],
      ),
    );
  }

  Widget _buildLinkButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: color),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.1),
        foregroundColor: Colors.white,
        minimumSize: const Size(200, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
