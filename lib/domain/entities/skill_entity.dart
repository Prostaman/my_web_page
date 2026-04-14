import 'package:flutter/material.dart';

class SkillEntity {
  final String title;
  final IconData? icon;
  final String? assetPath;
  final List<String> technologies;

  const SkillEntity({
    required this.title,
    this.icon,
    this.assetPath,
    required this.technologies,
  });
}
