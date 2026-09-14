import '../models/blog_post_model.dart';

class BlogData {
  static const List<BlogPostModel> posts = [
    BlogPostModel(
      title: 'Flutter Clean Architecture',
      category: 'Architecture',
      date: 'Jan 15, 2024',
      readingTime: '8 min read',
      content: 'A deep dive into implementing Clean Architecture in Flutter projects...',
      tags: ['Flutter', 'Clean Architecture', 'SOLID'],
    ),
    BlogPostModel(
      title: 'Offline-First Flutter with Hive',
      category: 'Data',
      date: 'Feb 02, 2024',
      readingTime: '6 min read',
      content: 'Learn how to build robust offline-first applications using Hive database...',
      tags: ['Flutter', 'Hive', 'Offline-first'],
    ),
    BlogPostModel(
      title: 'Riverpod State Management',
      category: 'State Management',
      date: 'Feb 20, 2024',
      readingTime: '10 min read',
      content: 'Mastering state management with Riverpod and StateNotifier...',
      tags: ['Flutter', 'Riverpod', 'State Management'],
    ),
    BlogPostModel(
      title: 'Dio REST API Integration',
      category: 'Networking',
      date: 'Mar 05, 2024',
      readingTime: '7 min read',
      content: 'Best practices for integrating REST APIs using the Dio package...',
      tags: ['Flutter', 'Dio', 'Networking'],
    ),
    BlogPostModel(
      title: 'Flutter Image Compression',
      category: 'Performance',
      date: 'Mar 18, 2024',
      readingTime: '5 min read',
      content: 'Strategies for efficient image compression in Flutter applications...',
      tags: ['Flutter', 'Performance', 'Images'],
    ),
    BlogPostModel(
      title: 'Firebase Crashlytics',
      category: 'DevOps',
      date: 'Apr 02, 2024',
      readingTime: '4 min read',
      content: 'Setting up and using Firebase Crashlytics to monitor app stability...',
      tags: ['Flutter', 'Firebase', 'Crashlytics'],
    ),
    BlogPostModel(
      title: 'Real Android Device Debugging',
      category: 'Debugging',
      date: 'Apr 15, 2024',
      readingTime: '6 min read',
      content: 'Tips and tricks for debugging Flutter apps on real Android devices...',
      tags: ['Flutter', 'Android', 'Debugging'],
    ),
  ];
}
