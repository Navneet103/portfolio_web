import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(60),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                Text(
                  "READY TO BUILD THE FUTURE?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        letterSpacing: 2,
                        fontSize: isMobile ? 28 : 42,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  "I'm currently available for senior roles and architectural consulting.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () => _launchEmail(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.background,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'GET IN TOUCH',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          const Divider(color: Colors.white10),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2024 DEV.CORE ARCHITECTS. BUILT WITH FLUTTER WASM.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _SocialLink(label: 'GITHUB', url: 'https://github.com'),
                    const SizedBox(width: 24),
                    _SocialLink(label: 'LINKEDIN', url: 'https://linkedin.com'),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hello@flutterarchitect.dev',
      query: 'subject=Portfolio Inquiry',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  final String url;

  const _SocialLink({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
