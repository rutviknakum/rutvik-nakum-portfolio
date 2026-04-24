import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 40),

          isMobile ? _mobileLayout() : _desktopLayout(),
          const SizedBox(height: 64),

          FadeInUp(child: _interestsRow()),
          const SizedBox(height: 64),

          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: _experienceTimeline(),
          ),
        ],
      ),
    );
  }

  // ─── Layouts ──────────────────────────────────────────────
  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: FadeInLeft(child: _bioContent())),
        const SizedBox(width: 60),
        Expanded(flex: 3, child: FadeInRight(child: _educationContent())),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [
        _bioContent(),
        const SizedBox(height: 40),
        _educationContent(),
      ],
    );
  }

  // ─── Bio Content ──────────────────────────────────────────
  Widget _bioContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Who Am I?',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Text(
          'I am Rutvik B. Nakum, an IT professional and Flutter Developer '
          'with a strong foundation in cross-platform mobile application '
          'development using Flutter, Firebase, and PostgreSQL. I hold an '
          'MSc in Information Technology from DA-IICT, Gandhinagar, and '
          'currently serve as an Assistant Professor at ITM SLS Baroda '
          'University, where I teach OOP (Java) and Computer Networks to '
          'both UG & PG students. With hands-on industry experience at '
          'Uminber and 28 INFOTECH, I bridge the gap between academic '
          'concepts and real-world implementation.',
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.85,
          ),
        ),
        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.primary.withOpacity(0.12)),
          ),
          child: Column(
            children: [
              _infoRow(Icons.email_outlined, 'rutvikb.nakum21@gmail.com'),
              _divider(),
              _infoRow(Icons.phone_outlined, '+91 8490008691'),
              _divider(),
              _infoRow(Icons.location_on_outlined, 'Vadodara, Gujarat'),
              _divider(),
              _infoRow(Icons.work_outline_rounded, 'ITM SLS Baroda University'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() => Container(
    height: 1,
    margin: const EdgeInsets.symmetric(vertical: 10),
    color: AppColors.primary.withOpacity(0.08),
  );

  // ─── Education ────────────────────────────────────────────
  Widget _educationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Education',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        _educationItem(
          icon: Icons.school_rounded,
          degree: 'MSc in Information Technology',
          field: 'Web & Mobile Dev · DSA · DBMS · Networks · OOP',
          college: 'DA-IICT, Gandhinagar',
          year: '2023 – 2025',
          cpi: 'CPI: 6.05',
          color: AppColors.primary, // ✅ Primary
        ),
        const SizedBox(height: 14),
        _educationItem(
          icon: Icons.menu_book_rounded,
          degree: 'BCA — Computer Applications',
          field: 'OOP · Mobile App Development',
          college: 'C.B Patel Computer College, Surat',
          year: '2020 – 2023',
          cpi: 'CPI: 6.17',
          color: AppColors.primary, // ✅ Same Primary (warning → primary)
        ),
      ],
    );
  }

  Widget _educationItem({
    required IconData icon,
    required String degree,
    required String field,
    required String college,
    required String year,
    required String cpi,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        degree,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        cpi,
                        style: GoogleFonts.roboto(
                          fontSize: 11,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  field,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: color,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      college,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      year,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Interests Row ────────────────────────────────────────
  Widget _interestsRow() {
    final interests = [
      {'icon': Icons.phone_android_rounded, 'label': 'Mobile Dev'},
      {'icon': Icons.extension_rounded, 'label': 'Chess'},
      {'icon': Icons.flight_rounded, 'label': 'Traveling'},
      {'icon': Icons.menu_book_rounded, 'label': 'Reading'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Interests',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: interests
              .map(
                (item) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item['label'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  // ─── Experience Timeline ──────────────────────────────────
  Widget _experienceTimeline() {
    final List<Map<String, dynamic>> experiences = [
      {
        'role': 'Assistant Professor',
        'company': 'ITM SLS Baroda University',
        'period': 'June 2025 – Present',
        'type': 'current',
        'points': [
          'Delivering lectures in OOP (Java) & Computer Networks to UG & PG students',
          'Class Coordinator for Second-Year Bachelor\'s students',
          'Mentoring Master\'s students — academic guidance & career support',
          'Conducting lab sessions, assignments & project-based learning',
          'Contributing to curriculum planning & outcome-based education',
        ],
      },
      {
        'role': 'Flutter Intern',
        'company': 'Uminber',
        'period': 'Jan 2025 – May 2025',
        'type': 'past',
        'points': [
          'Developed scalable mobile app features using Flutter & Firebase',
          'Implemented authentication & real-time database synchronization',
          'Worked with REST APIs and JSON data integration',
        ],
      },
      {
        'role': 'Junior Flutter Developer',
        'company': '28 INFOTECH',
        'period': 'Jun 2022 – Dec 2022',
        'type': 'past',
        'points': [
          'Developed cross-platform mobile applications using Flutter',
          'Integrated Firebase services — Auth, Firestore, Storage',
          'Optimized app performance and improved UI responsiveness',
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Experience',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        ...experiences.asMap().entries.map((entry) {
          final int index = entry.key;
          final exp = entry.value;
          final isLast = index == experiences.length - 1;
          final isCurrent = exp['type'] == 'current';

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCurrent
                            ? AppColors.primary
                            : Colors.transparent,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 160,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withOpacity(0.4),
                              AppColors.primary.withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? AppColors.primary.withOpacity(0.06)
                        : AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isCurrent
                          ? AppColors.primary.withOpacity(0.35)
                          : AppColors.primary.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              exp['role'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          if (isCurrent)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'CURRENT',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exp['company'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 11,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            exp['period'] as String,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      ...(exp['points'] as List<String>).map(
                        (point) => Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  point,
                                  style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  // ─── Info Row ─────────────────────────────────────────────
  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
