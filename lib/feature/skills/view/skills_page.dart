import 'package:flutter/material.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';
import '../data/skills_data.dart';
import 'widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
            title: 'My Skills',
            subtitle: 'Technical expertise and toolbelt.',
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: SkillsData.skills.map((skill) => SkillCard(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}
