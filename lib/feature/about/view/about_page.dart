import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'About Me',
            subtitle: 'NAVNEET KANOJIYA.',
          ),
          const SizedBox(height: 48),
          Responsive(
            mobile: Column(
              children: [
                _buildProfileImage(),
                const SizedBox(height: 48),
                _buildAboutText(),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildAboutText()),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildProfileImage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am a dedicated Flutter Developer with over 1.5 years of experience in building scalable, offline-first mobile applications. My expertise lies in architecting enterprise workflows and production-grade mobile systems that prioritize reliability and performance.",
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: 24),
        Text(
          "I specialize in Feature-First Clean Architecture, ensuring that the codebases I work on are maintainable, testable, and scalable. From handling complex image processing and wall measurements in survey platforms to building secure workforce management systems, I thrive on solving technical challenges that deliver real value to users.",
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: 24),
        Text(
          "My toolbelt includes Riverpod for state management, Hive and SQLite for local persistence, and Dio for robust networking. I'm passionate about continuous learning and staying ahead of the curve in the ever-evolving Flutter ecosystem.",
          style: AppTextStyles.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 350,
        height: 450,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: const Icon(
          Icons.person,
          size: 200,
          color: AppColors.textSecondary,
        ), // Placeholder for actual image
      ),
    );
  }
}
