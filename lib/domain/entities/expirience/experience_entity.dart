import 'company_app_entity.dart';

class ExperienceEntity {
  final String company;
  final String role;
  final String period;
  final String desc;
  final String? companyIcon;
  final String? companyUrl;
  final List<CompanyAppEntity>? apps;

  const ExperienceEntity({
    required this.company,
    required this.role,
    required this.period,
    required this.desc,
    this.companyIcon,
    this.companyUrl,
    this.apps,
  });
}
