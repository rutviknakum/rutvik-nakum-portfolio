import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../widgets/section_title.dart';

class PublicationsSection extends StatelessWidget {
  const PublicationsSection({super.key});

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
          const SectionTitle(title: 'Publications'),
          FadeInUp(child: _comingSoonCard()),
        ],
      ),
    );
  }

  Widget _comingSoonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Icon
          FadeInDown(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.article_outlined,
                size: 40,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Coming Soon Badge
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.warning.withOpacity(0.4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.schedule, size: 16, color: AppColors.warning),
                  const SizedBox(width: 8),
                  Text(
                    'COMING SOON',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.warning,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Text(
              'Research Publications',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Subtitle
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Research papers and journal publications are currently\n'
              'in progress and will be added soon.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Research Interests Tags
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Text(
                  'Research Interests',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children:
                      [
                            'Mobile App Development',
                            'Cross-Platform Systems',
                            'Flutter & Firebase',
                            'Software Architecture',
                            'Outcome-Based Education',
                          ]
                          .map(
                            (topic) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.25),
                                ),
                              ),
                              child: Text(
                                topic,
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
          const SizedBox(height: 32),

          // Google Scholar Link
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.school_outlined, size: 18),
              label: Text(
                'Follow on Google Scholar',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
