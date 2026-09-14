import 'package:flutter/material.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            title: 'Contact',
            subtitle: "Let's work together.",
          ),
          const SizedBox(height: 64),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 32 : 60),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "READY TO BUILD THE FUTURE?",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2.copyWith(
                    fontSize: isMobile ? 28 : 42,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "I'm currently available for new opportunities and architectural consulting.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLarge,
                ),
                const SizedBox(height: 48),
                CustomButton(
                  label: 'Get In Touch',
                  onPressed: () => UrlLauncherHelper.launchEmail(AppConstants.email, subject: 'Portfolio Inquiry'),
                  type: ButtonType.primary,
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: () => UrlLauncherHelper.launchEmail(AppConstants.email),
                  child: Text(
                    AppConstants.email,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () => UrlLauncherHelper.launchPhone(AppConstants.mobile),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 8),
                      Text(
                        AppConstants.mobile,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
