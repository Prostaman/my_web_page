import '../../domain/entities/project_entity.dart';

const List<ProjectEntity> projectsList = [
  ProjectEntity(
    title: 'Deutsche Verben B2',
    description: 'Mobile app for learning German B2 verbs.',
    assetPath: 'assets/icons/projects/deutsche_verben_b2_icon.png',
    androidUrl:
        'https://play.google.com/store/apps/details?id=de.b2.verben.trio',
    iosUrl: 'https://apps.apple.com/app/deutsche-verben-b2/id6751244239',
  ),
  ProjectEntity(
    title: 'Assistant metal detectorist',
    description: 'Android app for treasure hunters with metal detectors.',
    assetPath: 'assets/icons/projects/assistant_metal_detectorist_icon.png',
    androidUrl:
        'https://play.google.com/store/apps/details?id=com.metal_detectorist.trio_r',
  ),
];
