import '../../domain/entities/education_entity.dart';

const List<EducationEntity> educationList = [
  EducationEntity(
    degree: 'Master',
    specialization: 'Mobile Application Development',
    sub: 'Vistula University, Poland (2020-2022)',
    iconPath: 'assets/icons/education/logo_vistula_en.jpeg',
    isCircle: false,
  ),
  EducationEntity(
    degree: 'Bachelor',
    specialization: 'Automation & Computer Technologies',
    sub: 'NTUU "KPI", Ukraine (2016-2020)',
    iconPath: 'assets/icons/education/kpi_icon.png',
    isCircle: true,
  ),
];
