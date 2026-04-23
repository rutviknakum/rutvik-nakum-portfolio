import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavTap;
  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withOpacity(0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Two Line Logo ──────────────────────────
          Row(
            children: [
              // Accent Bar
              Container(
                width: 4,
                height: 36,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),

              // Name + Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RUTVIK B. NAKUM',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    'Assistant Professor ',
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: AppColors.textMuted,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ── Nav Links ─────────────────────────────
          if (!isMobile)
            Row(
              children: [
                'About',
                'Skills',
                'Publications',
                'Courses',
                'Projects',
                'Contact',
              ].map((item) => _navItem(item)).toList(),
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primary),
              onPressed: () {},
            ),
        ],
      ),
    );
  }

  Widget _navItem(String label) {
    return TextButton(
      onPressed: () => onNavTap(label),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        overlayColor: AppColors.primary,
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
