import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/footer.dart';
import '../../about/view/about_page.dart';
import '../../architecture/view/architecture_page.dart';
import '../../blog/view/blog_page.dart';
import '../../contact/view/contact_page.dart';
import '../../experience/view/experience_page.dart';
import '../../projects/view/projects_page.dart';
import '../../skills/view/skills_page.dart';
import 'widgets/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  final List<GlobalKey> _keys = List.generate(8, (_) => GlobalKey());
  
  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Architecture',
    'Experience',
    'Blog',
    'Contact',
  ];

  void _scrollToSection(int index) {
    final context = _keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        navItems: _navItems,
        onNavItemTap: _scrollToSection,
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _keys[0],
                  onViewProjects: () => _scrollToSection(3),
                  onContactMe: () => _scrollToSection(7),
                ),
                AboutSection(key: _keys[1]),
                SkillsSection(key: _keys[2]),
                ProjectsSection(key: _keys[3]),
                ArchitectureSection(key: _keys[4]),
                ExperienceSection(key: _keys[5]),
                BlogSection(key: _keys[6]),
                ContactSection(key: _keys[7]),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
