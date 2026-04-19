class CompanyAppEntity {
  final String name;
  final String iconPath;
  final String? androidUrl;
  final String? iosUrl;
  final String? githubUrl;

  const CompanyAppEntity({
    required this.name,
    required this.iconPath,
    this.androidUrl,
    this.iosUrl,
    this.githubUrl,
  });
}
