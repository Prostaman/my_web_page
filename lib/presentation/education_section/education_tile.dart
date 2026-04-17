import 'package:flutter/material.dart';

class EduTile extends StatelessWidget {
  final String degree;
  final String title;
  final String sub;
  final String? iconPath;
  final bool isCircle;

  const EduTile({
    super.key,
    required this.degree,
    required this.title,
    required this.sub,
    this.iconPath,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconPath != null)
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: isCircle ? null : BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: _buildImage(iconPath!),
            ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: degree.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                TextSpan(
                  text: "\n$title",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            sub,
            style: const TextStyle(color: Colors.white70, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    final Widget image = Image.asset(path, fit: BoxFit.contain);

    if (isCircle) {
      return ClipOval(child: image);
    } else {
      return ClipRRect(borderRadius: BorderRadius.circular(12), child: image);
    }
  }
}
