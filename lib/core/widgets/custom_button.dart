import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../../config/theme/app_text_styles.dart';

enum ButtonType { primary, outline, text }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.background,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
          ).copyWith(
            overlayColor: WidgetStateProperty.all(AppColors.secondary.withOpacity(0.2)),
          ),
          child: _buildChild(),
        );
      case ButtonType.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: _buildChild(),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: _buildChild(),
        );
    }
  }

  Widget _buildChild() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.button.copyWith(
          color: type == ButtonType.primary ? AppColors.background : AppColors.textPrimary
        )),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, size: 18),
        ],
      ],
    );
  }
}
