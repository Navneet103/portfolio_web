import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_text_styles.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';
import '../data/experience_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
            title: 'Experience',
            subtitle: 'My professional journey.',
          ),
          const SizedBox(height: 64),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ExperienceData.experience.length,
            itemBuilder: (context, index) {
              final exp = ExperienceData.experience[index];
              return _buildExperienceItem(exp, isMobile);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(ExperienceModel exp, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40), // <-- Fixed here
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) ...[
            SizedBox(
              width: 200,
              child: Text(
                exp.period,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 40),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile)
                  Text(
                    exp.period,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(exp.role, style: AppTextStyles.h3.copyWith(fontSize: 24)),
                Text(
                  exp.company,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                ...exp.bulletPoints.map(
                  (point) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(point, style: AppTextStyles.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
