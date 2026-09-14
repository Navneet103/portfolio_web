import '../models/project_model.dart';

class ProjectData {
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'School Infrastructure Survey & Execution Platform (CanImage)',
      description:
          'A comprehensive platform for pre-recce, execution, and post-recce survey stages with advanced image processing and CAD generation capabilities.',
      technologies: ['Flutter', 'Riverpod', 'Hive', 'REST APIs', 'Crashlytics'],
      features: [
        'Offline-first architecture using Hive',
        'Image processing and wall measurement',
        'Area calculation and object drawing',
        'DXF/CAD generation',
        'Geolocation tracking',
      ],
    ),
    ProjectModel(
      title: 'Paster Register & Workforce Management App',
      description:
          'Multi-role workflow management app for registration, profile management, and approval workflows with secure device verification.',
      technologies: ['Flutter', 'Firebase Auth', 'JWT', 'REST APIs', 'Google Maps'],
      features: [
        'Multi-role workflows',
        'Registration & Profile management',
        'Device-linked verification',
        'Offline persistence',
        'Google Maps integration',
      ],
    ),
    ProjectModel(
      title: 'CIMT-App',
      description:
          'Field execution app with offline-first workflows and background synchronization for seamless data management in remote areas.',
      technologies: ['Flutter', 'Hive', 'Dio', 'Crashlytics'],
      features: [
        'Offline-first field execution',
        'Background synchronization',
        'Image compression & Dio server failover',
        'Connectivity monitoring',
        'Device security checks',
      ],
    ),
  ];
}
