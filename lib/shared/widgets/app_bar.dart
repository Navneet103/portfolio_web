import 'package:flutter/material.dart';
import '../../config/constants/asset_constants.dart';
import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_styles.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../core/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> navItems;
  final Function(int) onNavItemTap;

  const CustomAppBar({
    super.key,
    required this.navItems,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    // Treat screens smaller than 900px as compact to avoid action row overflow
    final isCompact = MediaQuery.sizeOf(context).width < 900;

    return Container(
      color: AppColors.background.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          AssetConstants.logo,
          height: 40,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
        actions: [
          if (!isCompact) ...[
            ...navItems.asMap().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextButton(
                  onPressed: () => onNavItemTap(entry.key),
                  child: Text(
                    entry.value.toUpperCase(),
                    style: AppTextStyles.navItem.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(width: 12),
            Center(
              child: CustomButton(
                label: 'Resume',
                onPressed: () => UrlLauncherHelper.launchURL(AssetConstants.resume),
                type: ButtonType.outline,
              ),
            ),
            const SizedBox(width: 8),
          ] else ...[
            // Open the Scaffold drawer on compact screens
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textPrimary),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
