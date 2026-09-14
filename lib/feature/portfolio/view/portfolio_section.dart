import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/responsive_layout.dart';
import '../presentor/portfolio_riverpod.dart';
import '../presentor/portfolio_state.dart';
import 'widgets/project_card.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(portfolioProvider);
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SELECTED WORKS',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 32,
                ),
          ),
          const SizedBox(height: 48),
          if (state is PortfolioLoading)
            const Center(child: CircularProgressIndicator())
          else if (state is PortfolioLoaded)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return ProjectCard(project: state.projects[index]);
              },
            )
          else if (state is PortfolioError)
            Center(child: Text(state.message))
        ],
      ),
    );
  }
}
