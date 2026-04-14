class ExperienceEntity {
  final String company;
  final String role;
  final String period;
  final String desc;
  final String? androidUrl;
  final String? iosUrl;
  final String? githubUrl;
  final List<String>? appIcons;

  final String? companyIcon;

  const ExperienceEntity({
    required this.company,
    required this.role,
    required this.period,
    required this.desc,
    this.companyIcon,
    this.androidUrl,
    this.iosUrl,
    this.githubUrl,
    this.appIcons,
  });
}
