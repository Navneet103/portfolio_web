class ExperienceModel {
  final String company;
  final String role;
  final String period;
  final List<String> bulletPoints;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.period,
    required this.bulletPoints,
  });
}

class ExperienceData {
  static const List<ExperienceModel> experience = [
    ExperienceModel(
      company: 'Junior IT Executive – Software Development',
      role: 'Flutter Developer',
      period: 'April 2025 – Present',
      bulletPoints: [
        'Architecting and developing production-grade Flutter applications with clean architecture.',
        'Integrating complex REST APIs using Dio and implementing robust error handling.',
        'Developing offline-first workflows using Hive and SQLite for seamless user experience.',
        'Implementing advanced image processing, GPS, and location-based features.',
        'Managing secure authentication and device verification systems.',
        'Monitoring app health with Firebase Crashlytics and performing deep Android debugging.',
        'Optimizing background synchronization and server failover mechanisms.',
      ],
    ),
  ];
}
