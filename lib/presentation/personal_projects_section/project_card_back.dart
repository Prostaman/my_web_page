import 'package:flutter/material.dart';
import 'package:my_web_page/presentation/colors.dart';
import '../../domain/entities/project_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';

class ProjectCardBack extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCardBack({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
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
            'Check it out on:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (project.androidUrl != null)
                _buildLargeLinkButton(
                  icon: Icons.android,
                  label: 'Google Play',
                  color: AppColors.androidGreen,
                  onTap: () => openLink(project.androidUrl!),
                ),
              if (project.androidUrl != null && project.iosUrl != null)
                const SizedBox(width: 30),
              if (project.iosUrl != null)
                _buildLargeLinkButton(
                  icon: Icons.apple,
                  label: 'App Store',
                  color: Colors.white,
                  onTap: () => openLink(project.iosUrl!),
                ),
            ],
          ),
          if (project.androidUrl == null && project.iosUrl == null)
            const Text(
              'Links coming soon!',
              style: TextStyle(
                color: Colors.white38,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLargeLinkButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          iconSize: 50,
          icon: Icon(icon, color: color),
          onPressed: onTap,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 12),
        ),
      ],
    );
  }
}
