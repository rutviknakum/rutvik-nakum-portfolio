import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

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
          const SectionTitle(title: 'Achievements'),
          const SizedBox(height: 32),

          _sectionHeading(Icons.workspace_premium_outlined, 'Certifications'),
          const SizedBox(height: 20),

          isMobile ? _certListMobile() : _certGridDesktop(),

          const SizedBox(height: 52),

          _statsRow(isMobile),
        ],
      ),
    );
  }

  Widget _sectionHeading(IconData icon, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _certGridDesktop() {
    final items = _certItems();

    return Row(
      children: items.asMap().entries.map((e) {
        final isLast = e.key == items.length - 1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 16),
            child: _certCard(
              e.value['icon'] as IconData,
              e.value['title'] as String,
              e.value['org'] as String,
              e.value['year'] as String,
              e.value['desc'] as String,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _certListMobile() {
    return Column(
      children: _certItems().map((cert) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _certCard(
            cert['icon'] as IconData,
            cert['title'] as String,
            cert['org'] as String,
            cert['year'] as String,
            cert['desc'] as String,
          ),
        );
      }).toList(),
    );
  }

  List<Map<String, dynamic>> _certItems() => [
    {
      'icon': Icons.school_outlined,
      'title': 'Faculty Development\nProgram (FDP)',
      'org': 'Academic Institution',
      'year': '2025',
      'desc': 'Innovative Teaching, OBE\n& Learner-Centric Methodologies',
    },
    {
      'icon': Icons.flutter_dash,
      'title': 'Winter of Code\n— Flutter',
      'org': 'Open Source Program',
      'year': '2024',
      'desc': 'Open Source Flutter\nDevelopment Contribution',
    },
    {
      'icon': Icons.phone_android,
      'title': 'Android App\nDevelopment',
      'org': 'Certification Program',
      'year': '2023',
      'desc': 'Mobile Application\nDevelopment Fundamentals',
    },
  ];

  Widget _certCard(
    IconData icon,
    String title,
    String org,
    String year,
    String desc,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  year,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 6),

          Text(
            org,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            desc,
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsRow(bool isMobile) {
    final stats = [
      {'value': '1+', 'label': 'Year\nTeaching', 'icon': Icons.school},
      {
        'value': '3+',
        'label': 'Projects\nBuilt',
        'icon': Icons.rocket_launch_outlined,
      },
      {
        'value': '3',
        'label': 'Certifications\nEarned',
        'icon': Icons.workspace_premium,
      },
      {'value': '2', 'label': 'Industry\nRoles', 'icon': Icons.work_outline},
    ];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: isMobile
          ? Wrap(
              spacing: 16,
              runSpacing: 24,
              children: stats.map((s) {
                return SizedBox(
                  width: 140,
                  child: _statItem(
                    s['icon'] as IconData,
                    s['value'] as String,
                    s['label'] as String,
                  ),
                );
              }).toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats.map((s) {
                return _statItem(
                  s['icon'] as IconData,
                  s['value'] as String,
                  s['label'] as String,
                );
              }).toList(),
            ),
    );
  }

  Widget _statItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
