import 'package:flutter/material.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/publications_section.dart';
import '../sections/courses_section.dart';
import '../sections/projects_section.dart';
import '../sections/achievements_section.dart';
import '../sections/contact_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // દરેક Section ની GlobalKey
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _publicationsKey = GlobalKey();
  final GlobalKey _coursesKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Section name → Key mapping
  late final Map<String, GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = {
      'Hero': _heroKey,
      'About': _aboutKey,
      'Skills': _skillsKey,
      'Publications': _publicationsKey,
      'Courses': _coursesKey,
      'Projects': _projectsKey,
      'Achievements': _achievementsKey,
      'Contact': _contactKey,
    };
  }

  // Smooth Scroll Function
  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key == null) return;
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ── Main Scrollable Content ──
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Navbar height space
                const SizedBox(height: 70),

                // 1. Hero
                Container(key: _heroKey, child: const HeroSection()),

                // 2. About
                Container(key: _aboutKey, child: const AboutSection()),

                // 3. Skills
                Container(key: _skillsKey, child: const SkillsSection()),

                // 4. Publications
                Container(
                  key: _publicationsKey,
                  child: const PublicationsSection(),
                ),

                // 5. Courses
                Container(key: _coursesKey, child: const CoursesSection()),

                // 6. Projects
                Container(key: _projectsKey, child: const ProjectsSection()),

                // 7. Achievements
                Container(
                  key: _achievementsKey,
                  child: const AchievementsSection(),
                ),

                // 8. Contact
                Container(key: _contactKey, child: const ContactSection()),

                // Footer
                const Footer(),
              ],
            ),
          ),

          // ── Sticky NavBar (Top) ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(onNavTap: _scrollToSection),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
