import 'package:flutter/material.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';
import '../data/project_data.dart';
import 'widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            title: 'Featured Projects',
            subtitle: 'Real-world impact through code.',
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              mainAxisExtent: 450,
            ),
            itemCount: ProjectData.projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: ProjectData.projects[index]);
            },
          ),
        ],
      ),
    );
  }
}
