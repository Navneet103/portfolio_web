import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/widgets/interactive_card.dart';

class BentoSkillsWidget extends StatelessWidget {
  const BentoSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CORE EXPERTISE',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 32,
              ),
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 2.5,
          children: const [
            _SkillCard(
              title: 'State Architecture',
              description: 'Expertise in Riverpod, Bloc, and Redux for deterministic data flow.',
              icon: Icons.account_tree_outlined,
            ),
            _SkillCard(
              title: 'Offline-First / Local DB',
              description: 'Implementation of Isar, Hive, and SQLite for robust local synchronization.',
              icon: Icons.storage_outlined,
            ),
            _SkillCard(
              title: 'CustomPainter & Graphics',
              description: 'Advanced UI components, custom charting engines, and shaders.',
              icon: Icons.brush_outlined,
            ),
            _SkillCard(
              title: 'Profiling / Performance',
              description: 'Optimization of frame rates, WASM compilation, and memory leaks.',
              icon: Icons.speed_outlined,
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _SkillCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
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
