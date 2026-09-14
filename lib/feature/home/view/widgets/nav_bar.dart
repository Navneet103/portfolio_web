import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../presentor/scroll_controller_riverpod.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollManager = ref.watch(scrollProvider);
    final isMobile = ResponsiveLayout.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
          ),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.7),
            border: const Border(
              bottom: BorderSide(color: Colors.white10, width: 1),
            ),
          ),
          child: Row(
            children: [
              Text(
                'DEV.CORE',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24,
                      letterSpacing: 2,
                      color: AppColors.primary,
                    ),
              ),
              const Spacer(),
              if (!isMobile)
                Row(
                  children: [
                    _NavButton(
                      label: 'PROJECTS',
                      onPressed: () => scrollManager.scrollToSection(scrollManager.portfolioKey),
                    ),
                    const SizedBox(width: 40),
                    _NavButton(
                      label: 'EXPERTISE',
                      onPressed: () => scrollManager.scrollToSection(scrollManager.skillsKey),
                    ),
                    const SizedBox(width: 40),
                    _NavButton(
                      label: 'CONTACT',
                      onPressed: () => scrollManager.scrollToSection(scrollManager.contactKey),
                    ),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.primary),
                  onPressed: () {
                    // Drawer logic could go here if needed
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavButton({required this.label, required this.onPressed});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _isHovered ? AppColors.primary : AppColors.textSecondary,
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
