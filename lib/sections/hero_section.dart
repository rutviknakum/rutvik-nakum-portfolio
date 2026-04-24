import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
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
        clipBehavior: Clip.hardEdge, // ✅ Fix: overflow clip
        children: [
          // ── Background Decorations ──
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

          // ── Main Content ──
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80, // ✅ Fix: 24→20 mobile
              vertical: isMobile ? 48 : 100, // ✅ Fix: 60→48 mobile
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

  // ─── Layouts ─────────────────────────────────────────────
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
      children: [
        _profileArea(),
        const SizedBox(height: 32), // ✅ Fix: 40→32
        _textContent(),
      ],
    );
  }

  // ─── Text Content ────────────────────────────────────────
  Widget _textContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Pill
        FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: _statusPill(),
        ),
        const SizedBox(height: 20),

        // Hello
        FadeInLeft(
          duration: const Duration(milliseconds: 600),
          child: Text(
            AppStrings.heroSection,
            style: GoogleFonts.roboto(
              fontSize: 14, // ✅ Fix: 16→14 mobile safe
              color: AppColors.primary,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Name
        FadeInLeft(
          delay: const Duration(milliseconds: 200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // ✅ Fix: fluid font size
              final fontSize = constraints.maxWidth < 400 ? 36.0 : 46.0;
              return Text(
                AppStrings.name,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.1,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),

        // ✅ Fix: Title + Department — Expanded wrap
        FadeInLeft(
          delay: const Duration(milliseconds: 350),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                // ✅ KEY FIX: overflow prevent
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.title,
                      style: GoogleFonts.poppins(
                        fontSize: 17, // ✅ Fix: 20→17
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppStrings.university,
                      style: GoogleFonts.roboto(
                        fontSize: 12, // ✅ Fix: 13→12
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Tagline
        FadeInLeft(
          delay: const Duration(milliseconds: 500),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Text(
              AppStrings.tagline,
              style: GoogleFonts.roboto(
                fontSize: 13, // ✅ Fix: 14→13
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),

        // Buttons
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              _primaryButton('Download CV', Icons.download_rounded, () {
                html.AnchorElement(href: 'resume.pdf')
                  ..download = 'Rutvik_Nakum_Resume.pdf'
                  ..click();
              }),
              _outlineButton(
                'Contact Me',
                Icons.mail_outline_rounded,
                () => launchUrl(Uri.parse('mailto:${AppStrings.email}')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Quick Stats
        FadeInUp(
          delay: const Duration(milliseconds: 700),
          child: _quickStats(),
        ),
        const SizedBox(height: 24),

        // Social Icons
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            // ✅ Fix: Row→Wrap (overflow safe)
            spacing: 8,
            runSpacing: 8,
            children: [
              _socialChip(Icons.work_outline, 'LinkedIn', AppStrings.linkedIn),
              _socialChip(Icons.code_rounded, 'GitHub', AppStrings.github),
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

  // ─── Status Pill ─────────────────────────────────────────
  Widget _statusPill() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (_, __) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
            Flexible(
              // ✅ Fix: Flexible wrap
              child: Text(
                'Open to collaborations & research',
                style: GoogleFonts.roboto(
                  fontSize: 11, // ✅ Fix: 12→11
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Quick Stats ─────────────────────────────────────────
  Widget _quickStats() {
    final stats = [
      {'value': '1+', 'label': 'Year\nTeaching'},
      {'value': '3+', 'label': 'Projects\nBuilt'},
      {'value': 'MSc', 'label': 'DA-IICT\nGandhinagar'},
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stats.asMap().entries.map((e) {
        final isLast = e.key == stats.length - 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.value['value']!,
                  style: GoogleFonts.poppins(
                    fontSize: 20, // ✅ Fix: 22→20
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  e.value['label']!,
                  style: GoogleFonts.roboto(
                    fontSize: 10, // ✅ Fix: 11→10
                    color: AppColors.textMuted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.primary.withOpacity(0.2),
              ),
          ],
        );
      }).toList(),
    );
  }

  // ─── Profile Area ────────────────────────────────────────
  Widget _profileArea() {
    final isMobile = MediaQuery.of(context).size.width < 800;
    // ✅ Fix: mobile માં smaller photo
    final photoSize = isMobile ? 220.0 : 300.0;
    final ringSize = isMobile ? 236.0 : 320.0;

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
                width: ringSize + (_pulseController.value * 8),
                height: ringSize + (_pulseController.value * 8),
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
              width: photoSize,
              height: photoSize,
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
                    child: Icon(
                      Icons.person_rounded,
                      size: isMobile ? 70 : 100,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),

            // Flutter badge
            Positioned(
              bottom: isMobile ? 8 : 16,
              right: isMobile ? 0 : 8,
              child: _badgeChip(Icons.flutter_dash, 'Flutter Dev'),
            ),

            // Professor badge
            Positioned(
              top: isMobile ? 10 : 24,
              right: isMobile ? 0 : 0,
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

  // ─── Buttons ────────────────────────────────────────────
  Widget _primaryButton(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _outlineButton(String label, IconData icon, VoidCallback onTap) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
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
