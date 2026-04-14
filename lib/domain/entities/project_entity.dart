import 'package:flutter/material.dart';

class ProjectEntity {
  final String title;
  final String description;
  final IconData? icon;
  final String? assetPath;
  final String? androidUrl;
  final String? iosUrl;

  const ProjectEntity({
    required this.title,
    required this.description,
    this.icon,
    this.assetPath,
    this.androidUrl,
    this.iosUrl,
  }) : assert(icon != null || assetPath != null, 'Either icon or assetPath must be provided');
}
