import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/widgets/interactive_card.dart';
import '../../presentor/portfolio_state.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: project.tags.map((tag) => _buildTag(tag)).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            project.title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          _buildInfoRow('Architecture', project.architecture),
          const SizedBox(height: 8),
          _buildInfoRow('Impact', project.impactMetric),
          const Spacer(),
          const Divider(color: Colors.white10),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.techStack.map((tech) => _buildTechChip(tech)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag.toUpperCase(),
        style: const TextStyle(
          color: AppColors.secondary,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tech,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}
