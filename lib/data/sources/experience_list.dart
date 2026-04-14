import '../../domain/entities/experience_entity.dart';

const List<ExperienceEntity> experienceList = [
  ExperienceEntity(
    company: 'Poihaly z namy',
    role: 'Mobile Developer (Dart, Kotlin)',
    period: '1 year',
    companyIcon: 'assets/icons/companies/psn_icon.png',
    androidUrl: 'https://play.google.com/store/apps/details?id=psn.hotels.app',
    iosUrl: 'https://apps.apple.com/us/app/psn-hotels/id6480569224',
    githubUrl: 'https://github.com/Prostaman/crm_mobile_psn',
    appIcons: ['assets/icons/projects/PSN_icon.png'],
    desc:
        'Redesigned and rebuilt a malfunctioning Flutter application used by tourism managers. The app enables users to create, store, process, and upload media content to a server, linking it to specific hotel locations. Implemented full offline functionality by integrating a local database containing information on over 100,000 hotels. Additionally, developed automated tests to ensure application stability and reliability.',
  ),
  ExperienceEntity(
    company: 'Initium Group',
    role: 'Android Developer (Kotlin)',
    period: '2.7 years',
    companyIcon: 'assets/icons/companies/initium_icon.png',
    desc:
        'Responsibilities:\n1. Developing Android applications from scratch based on UI/UX designer models and API documentation. Around 325 Android applications were created.\n2. Reverse engineering of Android applications.',
  ),
  ExperienceEntity(
    company: 'YELLOWS Software House',
    role: 'Intern Android Developer (Kotlin)',
    period: '3 months',
    companyIcon: 'assets/icons/companies/yellows_icon.png',
    appIcons: [
      'assets/icons/projects/yemath_Icon.png',
      'assets/icons/projects/run_chlodnia_icon.png'
    ],
    desc:
        'Development of an Android application from scratch based on UI/UX designer models and API documentation.\nProjects:\n1. YeMath (Educational game for children).\n2. Android application for the MC9300 scanner (for warehouse management of agricultural products).',
  ),
];
