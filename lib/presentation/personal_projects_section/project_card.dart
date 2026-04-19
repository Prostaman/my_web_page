import 'package:flutter/material.dart';
import '../../domain/entities/project_entity.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
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
          ), // Constraints for consistency in grid/rows
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
