import 'package:flutter/material.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';
import '../data/blog_data.dart';
import 'widgets/blog_card.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Blog',
            subtitle: 'Sharing my knowledge.',
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              mainAxisExtent: 350,
            ),
            itemCount: BlogData.posts.length,
            itemBuilder: (context, index) {
              return BlogCard(
                post: BlogData.posts[index],
                onTap: () {
                  // Navigate to detail page
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
