import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../config/constants/social_links.dart';
import '../../../../core/widgets/social_icon_button.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButton(
          icon: FontAwesomeIcons.github,
          url: SocialLinks.github,
        ),
        const SizedBox(width: 24),
        SocialIconButton(
          icon: FontAwesomeIcons.linkedinIn,
          url: SocialLinks.linkedin,
        ),
        const SizedBox(width: 24),
        SocialIconButton(
          icon: FontAwesomeIcons.medium,
          url: SocialLinks.medium,
        ),
      ],
    );
  }
}
