import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../data/skills_data.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  String _selectedCategory = 'language';

  final List<Map<String, dynamic>> _categories = [
    {'key': 'language', 'label': 'Languages', 'icon': Icons.code_rounded},
    {
      'key': 'framework',
      'label': 'Frameworks & DB',
      'icon': Icons.layers_rounded,
    },
    {'key': 'tool', 'label': 'Tools', 'icon': Icons.build_rounded},
    {'key': 'teaching', 'label': 'Teaching', 'icon': Icons.school_rounded},
  ];

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _selectCategory(String key) {
    setState(() => _selectedCategory = key);
    _progressController.reset();
    _progressController.forward();
  }

  List _filteredSkills() =>
      skillsList.where((s) => s.category == _selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      color: AppColors.surfaceAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Skills'),
          const SizedBox(height: 8),
          FadeInDown(
            child: Text(
              'Technologies & tools I work with',
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: AppColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // ── Tab Selector ─────────────────────────
          FadeInUp(child: isMobile ? _tabsMobile() : _tabsDesktop()),
          const SizedBox(height: 32),

          // ── Content ──────────────────────────────
          isMobile ? _mobileContent() : _desktopContent(),
        ],
      ),
    );
  }

  // ─── Tab Bar Desktop ─────────────────────────────────────
  Widget _tabsDesktop() {
    return Row(
      children: _categories.map((cat) {
        final isSelected = _selectedCategory == cat['key'];
        return GestureDetector(
          onTap: () => _selectCategory(cat['key']),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.surface,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.2),
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  cat['icon'] as IconData,
                  size: 16,
                  color: isSelected ? Colors.white : AppColors.textMuted,
                ),
                const SizedBox(width: 8),
                Text(
                  cat['label'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // ─── Tab Bar Mobile ──────────────────────────────────────
  Widget _tabsMobile() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((cat) {
          final isSelected = _selectedCategory == cat['key'];
          return GestureDetector(
            onTap: () => _selectCategory(cat['key']),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withOpacity(0.2),
                ),
              ),
              child: Text(
                cat['label'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─── Desktop Content: Skills + Summary ───────────────────
  Widget _desktopContent() {
    final skills = _filteredSkills();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Skill Bars
        Expanded(flex: 3, child: _skillBarList(skills)),
        const SizedBox(width: 40),
        // Right: Summary Card
        Expanded(flex: 2, child: FadeInRight(child: _summaryCard())),
      ],
    );
  }

  // ─── Mobile Content ───────────────────────────────────────
  Widget _mobileContent() {
    final skills = _filteredSkills();
    return Column(
      children: [
        _skillBarList(skills),
        const SizedBox(height: 28),
        _summaryCard(),
      ],
    );
  }

  // ─── Skill Bar List ───────────────────────────────────────
  Widget _skillBarList(List skills) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.12)),
      ),
      child: Column(
        children: skills.asMap().entries.map((entry) {
          final i = entry.key;
          final skill = entry.value;

          // Staggered animation per skill
          final animation =
              Tween<double>(begin: 0.0, end: skill.level as double).animate(
                CurvedAnimation(
                  parent: _progressController,
                  curve: Interval(
                    i * 0.12,
                    (i * 0.12 + 0.5).clamp(0.0, 1.0),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              );

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      skill.name as String,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (_, _) => Text(
                        '${(animation.value * 100).toInt()}%',
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Track
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (_, _) => FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: animation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withOpacity(0.7),
                              AppColors.primary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─── Summary Card ─────────────────────────────────────────
  Widget _summaryCard() {
    final Map<String, Map<String, dynamic>> summaries = {
      'language': {
        'title': 'Strong in Dart & Java',
        'desc':
            'Proficient in multiple languages with primary focus on '
            'Dart for Flutter development and Java for '
            'Object-Oriented Programming.',
        'items': ['Dart', 'Java', 'C', 'C++', 'SQL'],
        'icon': Icons.code_rounded,
      },
      'framework': {
        'title': 'Flutter-First Developer',
        'desc':
            'Expert in building cross-platform apps with Flutter, '
            'real-time data with Firebase, and '
            'relational data with PostgreSQL.',
        'items': ['Flutter', 'Firebase', 'PostgreSQL', 'REST APIs'],
        'icon': Icons.layers_rounded,
      },
      'tool': {
        'title': 'Modern Dev Workflow',
        'desc':
            'Comfortable with industry-standard development tools '
            'for building, debugging, and shipping '
            'mobile applications efficiently.',
        'items': ['Git/GitHub', 'VS Code', 'Android Studio', 'Xcode'],
        'icon': Icons.build_rounded,
      },
      'teaching': {
        'title': 'Educator & Mentor',
        'desc':
            'Passionate about outcome-based education, student '
            'mentoring, and bridging the gap between '
            'academia and industry.',
        'items': ['OOP (Java)', 'Mentoring', 'OBE', 'Curriculum Planning'],
        'icon': Icons.school_rounded,
      },
    };

    final summary = summaries[_selectedCategory]!;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: Container(
        key: ValueKey(_selectedCategory),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                summary['icon'] as IconData,
                color: AppColors.primary,
                size: 26,
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              summary['title'] as String,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // Desc
            Text(
              summary['desc'] as String,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 20),

            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (summary['items'] as List<String>)
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
