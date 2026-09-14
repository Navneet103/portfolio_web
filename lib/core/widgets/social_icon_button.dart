import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../animations/hover_animation.dart';
import '../utils/url_launcher_helper.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final double size;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return HoverAnimation(
      child: IconButton(
        onPressed: () => UrlLauncherHelper.launchURL(url),
        icon: Icon(icon, color: AppColors.textPrimary, size: size),
        splashRadius: 24,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
