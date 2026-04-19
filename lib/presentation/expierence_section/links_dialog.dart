import 'package:flutter/material.dart';

import '../../domain/entities/expirience/company_app_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';
import '../github_icon.dart';

void showAppLinksDialog(BuildContext context, CompanyAppEntity app) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(app.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (app.androidUrl != null)
              ListTile(
                leading: const Icon(Icons.android, color: Color(0xFF3DDC84)),
                title: const Text('Google Play'),
                onTap: () {
                  Navigator.pop(context);
                  openLink(app.androidUrl!);
                },
              ),
            if (app.iosUrl != null)
              ListTile(
                leading: const Icon(Icons.apple, color: Colors.white),
                title: const Text('App Store'),
                onTap: () {
                  Navigator.pop(context);
                  openLink(app.iosUrl!);
                },
              ),
            if (app.githubUrl != null)
              ListTile(
                leading: GithubIcon(size: 24, color: Colors.white70),
                title: const Text('GitHub Source'),
                onTap: () {
                  Navigator.pop(context);
                  openLink(app.githubUrl!);
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
