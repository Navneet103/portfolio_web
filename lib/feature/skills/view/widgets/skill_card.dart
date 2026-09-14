import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/animations/hover_animation.dart';
import '../../models/skill_model.dart';

class SkillCard extends StatelessWidget {
  final SkillModel skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return HoverAnimation(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        ),
        child: Text(
          skill.name,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
