import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Stack(
        children: [
          // ── Background Decorations ───────────────
          Positioned(
            right: -60,
            top: -60,
            child: _glowCircle(300, AppColors.primary.withOpacity(0.06)),
          ),
          Positioned(
            left: -40,
            bottom: -40,
            child: _glowCircle(200, AppColors.primary.withOpacity(0.04)),
          ),

          // ── Main Content ─────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 60 : 100,
            ),
            child: isMobile ? _mobileLayout() : _desktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _glowCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  // ─── Layouts ──────────────────────────────────────────────
  Widget _desktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: _textContent()),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _profileArea()),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_profileArea(), const SizedBox(height: 40), _textContent()],
    );
  }

  // ─── Text Content ─────────────────────────────────────────
  Widget _textContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Pill
        FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: _statusPill(),
        ),
        const SizedBox(height: 24),

        // Hello
        FadeInLeft(
          duration: const Duration(milliseconds: 600),
          child: Text(
            AppStrings.heroSection,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Name
        FadeInLeft(
          delay: const Duration(milliseconds: 200),
          child: Text(
            AppStrings.name,
            style: GoogleFonts.poppins(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Title + Department
        FadeInLeft(
          delay: const Duration(milliseconds: 350),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    AppStrings.university,
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Tagline
        FadeInLeft(
          delay: const Duration(milliseconds: 500),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Text(
              AppStrings.tagline,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Buttons
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: 14,
            runSpacing: 12,
            children: [
              _primaryButton('Download CV', Icons.download_rounded, () async {
                final Uri url = Uri.parse(AppStrings.resumeUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              }),
              _outlineButton(
                'Contact Me',
                Icons.mail_outline_rounded,
                () => launchUrl(Uri.parse('mailto:${AppStrings.email}')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Quick Stats Row
        FadeInUp(
          delay: const Duration(milliseconds: 700),
          child: _quickStats(),
        ),
        const SizedBox(height: 28),

        // Social Icons
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Row(
            children: [
              _socialChip(Icons.work_outline, 'LinkedIn', AppStrings.linkedIn),
              const SizedBox(width: 10),
              _socialChip(Icons.code_rounded, 'GitHub', AppStrings.github),
              const SizedBox(width: 10),
              _socialChip(
                Icons.school_outlined,
                'Scholar',
                AppStrings.googleScholar,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Status Pill ──────────────────────────────────────────
  Widget _statusPill() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (_, __) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.lerp(
                  AppColors.success,
                  AppColors.success.withOpacity(0.4),
                  _pulseController.value,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Open to collaborations & research',
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Quick Stats ──────────────────────────────────────────
  Widget _quickStats() {
    final stats = [
      {'value': '1+', 'label': 'Year\nTeaching'},
      {'value': '3+', 'label': 'Projects\nBuilt'},
      {'value': 'MSc', 'label': 'DA-IICT\nGandhinagar'},
    ];

    return Row(
      children: stats.asMap().entries.map((e) {
        final isLast = e.key == stats.length - 1;
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.value['value']!,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  e.value['label']!,
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.primary.withOpacity(0.2),
              ),
          ],
        );
      }).toList(),
    );
  }

  // ─── Profile Area ─────────────────────────────────────────
  Widget _profileArea() {
    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow ring
            AnimatedBuilder(
              animation: _pulseController,
              builder: (_, __) => Container(
                width: 310 + (_pulseController.value * 10),
                height: 310 + (_pulseController.value * 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(
                      0.15 - _pulseController.value * 0.1,
                    ),
                    width: 1,
                  ),
                ),
              ),
            ),

            // Photo circle
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 40,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_photo.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.surfaceAlt,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 100,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),

            // Flutter badge
            Positioned(
              bottom: 16,
              right: 8,
              child: _badgeChip(Icons.flutter_dash, 'Flutter Dev'),
            ),

            // Professor badge
            Positioned(
              top: 24,
              right: 0,
              child: _badgeChip(Icons.school_rounded, 'Asst. Prof'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badgeChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.primary),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Buttons ──────────────────────────────────────────────
  Widget _primaryButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 17),
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _outlineButton(String label, IconData icon, VoidCallback onTap) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 17),
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _socialChip(IconData icon, String label, String url) {
    return InkWell(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
