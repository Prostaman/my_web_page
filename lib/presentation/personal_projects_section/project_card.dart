import 'package:flutter/material.dart';
import '../../domain/entities/project_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';
import '../colors.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  final bool showActions;

  const ProjectCard({
    required this.project,
    this.showActions = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: showActions ? 280 : 220, // Увеличиваем высоту, если есть кнопки
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _buildProjectIcon(),
          const SizedBox(height: 15),
          Text(
            project.title,
            softWrap: true,
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
          ),
          if (showActions) ...[
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (project.androidUrl != null)
                  _buildSmallLinkButton(
                    icon: Icons.android,
                    color: AppColors.androidGreen,
                    onTap: () => openLink(project.androidUrl!),
                  ),
                if (project.androidUrl != null && project.iosUrl != null)
                  const SizedBox(width: 20),
                if (project.iosUrl != null)
                  _buildSmallLinkButton(
                    icon: Icons.apple,
                    color: Colors.white,
                    onTap: () => openLink(project.iosUrl!),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSmallLinkButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: color, size: 28),
      onPressed: onTap,
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
