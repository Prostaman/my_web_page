class EducationEntity {
  final String degree;
  final String specialization;
  final String sub;
  final String? iconPath;
  final bool isCircle;

  const EducationEntity({
    required this.degree,
    required this.specialization,
    required this.sub,
    this.iconPath,
    this.isCircle = false,
  });
}
