import 'package:flutter/material.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/section_title.dart';
import '../../../config/theme/app_text_styles.dart';
import 'widgets/architecture_diagram.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

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
            title: 'Architecture',
            subtitle: 'How I build scalable systems.',
          ),
          const SizedBox(height: 48),
          Responsive(
            mobile: Column(
              children: [
                const ArchitectureDiagram(),
                const SizedBox(height: 48),
                _buildArchitectureDescription(),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 3, child: ArchitectureDiagram()),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildArchitectureDescription()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArchitectureDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I follow a Feature-First Clean Architecture approach to ensure code maintainability and scalability.",
          style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildPoint("UI Layer", "Uses Riverpod and StateNotifier for predictable state management."),
        _buildPoint("Domain Layer", "Contains pure business logic and entity models, independent of external libraries."),
        _buildPoint("Data Layer", "Handles API calls with Dio and local persistence with Hive/SQLite, implementing repository patterns."),
        const SizedBox(height: 24),
        Text(
          "This separation of concerns allows for easier testing, faster feature development, and robust offline-first capabilities.",
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildPoint(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.bodyMedium.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(desc, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
