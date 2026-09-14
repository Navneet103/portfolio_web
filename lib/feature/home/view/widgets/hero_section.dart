import 'package:flutter/material.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/asset_constants.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/animations/fade_animation.dart';
import '../../../../core/animations/slide_animation.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import 'social_links.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onContactMe,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return Container(
      // Use minHeight instead of a rigid fixed height to allow expansion on short screens
      constraints: BoxConstraints(
        minHeight: (size.height - 70).clamp(0.0, double.infinity),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 32 : 48,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Hug content rather than forcing full bounds
        children: [
          // Subtitle Badge
          SlideAnimation(
            begin: const Offset(0, 0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.bolt, size: 16, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    AppConstants.heroGreeting.toUpperCase(),
                    style: AppTextStyles.mono.copyWith(
                      fontSize: isMobile ? 11 : 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Main Title with Gradient
          SlideAnimation(
            delay: const Duration(milliseconds: 100),
            begin: const Offset(0, 0.1),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                AppConstants.heroTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.h1.copyWith(
                  fontSize: isMobile ? 38 : (size.height < 700 ? 56 : 84),
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: isMobile ? -1.5 : -3,
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Subtitle
          FadeAnimation(
            delay: const Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Text(
                AppConstants.heroSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: isMobile ? 15 : 20,
                  color: AppColors.textSecondary.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 28 : 40),

          // Actions
          FadeAnimation(
            delay: const Duration(milliseconds: 500),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                CustomButton(
                  label: 'View Projects',
                  onPressed: onViewProjects,
                  type: ButtonType.primary,
                ),
                CustomButton(
                  label: 'Get Resume',
                  onPressed: () => UrlLauncherHelper.launchURL(AssetConstants.resume),
                  type: ButtonType.outline,
                ),
                CustomButton(
                  label: 'Contact Me',
                  onPressed: onContactMe,
                  type: ButtonType.text,
                  icon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 32 : 48),

          // Socials
          const FadeAnimation(
            delay: Duration(milliseconds: 700),
            child: SocialLinksWidget(),
          ),
        ],
      ),
    );
  }
}