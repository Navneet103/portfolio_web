import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';

class ArchitectureDiagram extends StatelessWidget {
  const ArchitectureDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          _buildLayer('UI LAYER', 'Widgets, Pages, Presenters', AppColors.primary),
          _buildArrow(),
          _buildLayer('DOMAIN LAYER', 'Models, Repository Interfaces', AppColors.secondary),
          _buildArrow(),
          _buildLayer('DATA LAYER', 'Data Sources, DTOs, Repositories', Colors.purpleAccent),
        ],
      ),
    );
  }

  Widget _buildLayer(String title, String subtitle, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.h3.copyWith(fontSize: 20, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }

  Widget _buildArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Icon(Icons.arrow_downward, color: AppColors.textSecondary),
    );
  }
}
