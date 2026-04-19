import 'package:flutter/material.dart';
import 'package:my_web_page/domain/entities/expirience/company_app_entity.dart';
import '../../infrastructure/services/url_launcher_service.dart';

import '../../domain/entities/expirience/experience_entity.dart';
import 'links_dialog.dart';

class ExpTile extends StatelessWidget {
  final ExperienceEntity experience;

  const ExpTile({required this.experience, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (experience.companyIcon != null)
                MouseRegion(
                  cursor: experience.companyUrl != null
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: GestureDetector(
                    onTap: experience.companyUrl != null
                        ? () => openLink(experience.companyUrl!)
                        : null,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 64,
                        height: 64,
                        padding: const EdgeInsets.all(0),
                        child: Image.asset(
                          experience.companyIcon!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              else
                const Icon(
                  Icons.business_center,
                  color: Colors.blueAccent,
                  size: 48,
                ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            experience.company,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      experience.role,
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Text(
                experience.period,
                style: const TextStyle(color: Colors.white38),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(experience.desc, style: const TextStyle(color: Colors.white70)),
          if (experience.apps != null && experience.apps!.isNotEmpty) ...[
            const SizedBox(height: 30),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: experience.apps!
                    .map(
                      (app) => _hasAnyAppLinks(app)
                          ? MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => showAppLinksDialog(context, app),
                                child: _buildAppIcon(app.iconPath, app.name),
                              ),
                            )
                          : _buildAppIcon(app.iconPath, app.name),
                    )
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAppIcon(String iconPath, String name) {
    return Tooltip(
      message: name,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(iconPath, width: 40, height: 40),
      ),
    );
  }

  bool _hasAnyAppLinks(CompanyAppEntity app) {
    return app.androidUrl != null ||
        app.iosUrl != null ||
        app.githubUrl != null;
  }
}
