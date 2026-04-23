import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../data/projects_data.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _filter = 'all';

  List get _filtered => _filter == 'all'
      ? projectsList
      : projectsList.where((p) => p.type == _filter).toList();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Row ──────────────────────────────
          FadeInDown(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SectionTitle(title: 'Projects'),
                Text(
                  '${_filtered.length} project${_filtered.length != 1 ? 's' : ''}',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── Filter Tabs ─────────────────────────────
          FadeInUp(child: _filterRow(isMobile)),
          const SizedBox(height: 36),

          // ── Project Cards ───────────────────────────
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: isMobile
                ? _mobileList(key: ValueKey(_filter))
                : _desktopGrid(key: ValueKey(_filter)),
          ),
        ],
      ),
    );
  }

  // ─── Filter Row ───────────────────────────────────────────
  Widget _filterRow(bool isMobile) {
    final filters = [
      {'key': 'all', 'label': 'All Projects', 'icon': Icons.grid_view_rounded},
      {'key': 'academic', 'label': 'Academic', 'icon': Icons.school_outlined},
      {'key': 'personal', 'label': 'Personal', 'icon': Icons.person_outline},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: filters.map((f) {
        final isSelected = _filter == f['key'];
        return GestureDetector(
          onTap: () => setState(() => _filter = f['key'] as String),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
                        color: AppColors.primary.withOpacity(0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  f['icon'] as IconData,
                  size: 15,
                  color: isSelected ? Colors.white : AppColors.textMuted,
                ),
                const SizedBox(width: 7),
                Text(
                  f['label'] as String,
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

  // ─── Desktop Grid ─────────────────────────────────────────
  Widget _desktopGrid({Key? key}) {
    final projects = _filtered;
    return GridView.builder(
      key: key,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.55,
      ),
      itemCount: projects.length,
      itemBuilder: (_, i) => FadeInUp(
        delay: Duration(milliseconds: i * 100),
        child: _ProjectCard(project: projects[i]),
      ),
    );
  }

  // ─── Mobile List ──────────────────────────────────────────
  Widget _mobileList({Key? key}) {
    final projects = _filtered;
    return Column(
      key: key,
      children: projects
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FadeInUp(
                delay: Duration(milliseconds: e.key * 100),
                child: _ProjectCard(project: e.value),
              ),
            ),
          )
          .toList(),
    );
  }
}

// ─── Project Card Widget ──────────────────────────────────────
class _ProjectCard extends StatefulWidget {
  final dynamic project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Color get _typeColor {
    switch (widget.project.type) {
      case 'academic':
        return AppColors.primary;
      case 'personal':
        return AppColors.warning;
      default:
        return AppColors.textMuted;
    }
  }

  String get _typeLabel {
    switch (widget.project.type) {
      case 'academic':
        return 'ACADEMIC';
      case 'personal':
        return 'PERSONAL';
      default:
        return 'PROJECT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? _typeColor.withOpacity(0.5)
                : AppColors.primary.withOpacity(0.12),
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? _typeColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.04),
              blurRadius: _hovered ? 24 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top Row: Icon + Badge ──────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Project Icon
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? _typeColor.withOpacity(0.15)
                          : AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.rocket_launch_outlined,
                      color: _hovered ? _typeColor : AppColors.primary,
                      size: 20,
                    ),
                  ),

                  // Type Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _typeLabel,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: _typeColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Title ──────────────────────────────
              Text(
                widget.project.title as String,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),

              // ── Description ────────────────────────
              Expanded(
                child: Text(
                  widget.project.description as String,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),

              // ── Tech Tags ──────────────────────────
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: (widget.project.technologies as List)
                    .map(
                      (tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceAlt,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.15),
                          ),
                        ),
                        child: Text(
                          tech as String,
                          style: GoogleFonts.roboto(
                            fontSize: 11,
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),

              // ── Bottom: Links ──────────────────────
              Row(
                children: [
                  if ((widget.project.githubUrl as String).isNotEmpty)
                    _linkButton(
                      icon: Icons.code_rounded,
                      label: 'Code',
                      onTap: () {},
                    ),
                  const SizedBox(width: 10),
                  if ((widget.project.liveUrl as String).isNotEmpty)
                    _linkButton(
                      icon: Icons.open_in_new_rounded,
                      label: 'Live',
                      onTap: () {},
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _linkButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
