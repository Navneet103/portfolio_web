import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/animations/hover_animation.dart';
import '../../models/blog_post_model.dart';

class BlogCard extends StatelessWidget {
  final BlogPostModel post;
  final VoidCallback onTap;

  const BlogCard({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverAnimation(
      scale: 1.02,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      post.category.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Text(
                    post.readingTime,
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                post.title,
                style: AppTextStyles.h3.copyWith(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                post.content,
                style: AppTextStyles.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Read More',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, color: AppColors.primary, size: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
