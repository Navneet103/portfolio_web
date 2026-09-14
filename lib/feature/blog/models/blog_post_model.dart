class BlogPostModel {
  final String title;
  final String category;
  final String date;
  final String readingTime;
  final String content;
  final List<String> tags;
  final String? imageUrl;

  const BlogPostModel({
    required this.title,
    required this.category,
    required this.date,
    required this.readingTime,
    required this.content,
    required this.tags,
    this.imageUrl,
  });
}
