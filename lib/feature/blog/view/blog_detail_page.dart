import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../../../core/responsive/responsive.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/footer.dart';
import '../models/blog_post_model.dart';

class BlogDetailPage extends StatelessWidget {
  final BlogPostModel post;

  const BlogDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        navItems: const ['Back to Home'],
        onNavItemTap: (_) => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 150,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.category.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    post.title,
                    style: AppTextStyles.h1.copyWith(
                      fontSize: isMobile ? 36 : 56,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text(post.date, style: AppTextStyles.bodyMedium),
                      const SizedBox(width: 20),
                      const Icon(Icons.circle, size: 4, color: AppColors.textSecondary),
                      const SizedBox(width: 20),
                      Text(post.readingTime, style: AppTextStyles.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 48),
                  if (post.imageUrl != null)
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(Icons.image, size: 100, color: Colors.white10),
                    ),
                  const SizedBox(height: 48),
                  Text(
                    post.content * 10, // Simulating long content
                    style: AppTextStyles.bodyLarge.copyWith(height: 1.8),
                  ),
                  const SizedBox(height: 48),
                  _buildCodeBlock(
                    'void main() {\n  print("Hello, Clean Architecture!");\n}',
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: post.tags
                        .map((tag) => Chip(
                              label: Text(tag),
                              backgroundColor: AppColors.surface,
                              side: BorderSide(color: AppColors.primary.withOpacity(0.2)),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        code,
        style: const TextStyle(
          color: Color(0xFFE6EDF3),
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }
}
