import 'package:flutter/material.dart';
import '../../config/constants/app_constants.dart';
import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        children: [
          Text(
            '© ${DateTime.now().year} ${AppConstants.name.toUpperCase()}.',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Built with Flutter for Web',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 10,
              color: AppColors.textSecondary.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
