import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class Navbar extends StatelessWidget {
  final Function(String) onNavTap;

  const Navbar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withOpacity(0.1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Logo / Name ──
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.name.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  'Assistant Professor',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),

          // ── Nav Links / Hamburger ──
          isMobile
              ? _HamburgerButton(onNavTap: onNavTap)
              : _DesktopNavLinks(onNavTap: onNavTap),
        ],
      ),
    );
  }
}

// ─── Desktop Nav Links ────────────────────────────────────────
class _DesktopNavLinks extends StatelessWidget {
  final Function(String) onNavTap;
  const _DesktopNavLinks({required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final links = ['About', 'Courses', 'Projects', 'Skills', 'Contact'];

    return Row(
      children: links.map((link) {
        return Padding(
          padding: const EdgeInsets.only(left: 28),
          child: InkWell(
            onTap: () => onNavTap(link),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: Text(
                link,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─── Hamburger Button ─────────────────────────────────────────
class _HamburgerButton extends StatelessWidget {
  final Function(String) onNavTap;
  const _HamburgerButton({required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => _MobileMenu(
            onNavTap: (section) {
              Navigator.pop(context);
              onNavTap(section);
            },
          ),
        );
      },
      icon: const Icon(Icons.menu_rounded),
      color: AppColors.textPrimary,
      iconSize: 26,
    );
  }
}

// ─── Mobile Menu Sheet ────────────────────────────────────────
class _MobileMenu extends StatelessWidget {
  final Function(String) onNavTap;
  const _MobileMenu({required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final links = [
      {'label': 'About', 'icon': Icons.person_outline_rounded},
      {'label': 'Courses', 'icon': Icons.menu_book_rounded},
      {'label': 'Projects', 'icon': Icons.code_rounded},
      {'label': 'Skills', 'icon': Icons.psychology_outlined},
      {'label': 'Contact', 'icon': Icons.mail_outline_rounded},
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: AppColors.primary.withOpacity(0.12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag Handle ──
          Container(
            margin: const EdgeInsets.only(top: 14, bottom: 4),
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.25),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ── Profile Mini Header (Navigation text ની જગ્યાએ) ──
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
            child: Row(
              children: [
                // Avatar circle
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.12),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'RN',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.name,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Assistant Professor',
                        style: GoogleFonts.roboto(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                // Close button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: AppColors.primary.withOpacity(0.08)),

          const SizedBox(height: 8),

          // ── Nav Items ──
          ...links.map(
            (item) => _NavItem(
              icon: item['icon'] as IconData,
              label: item['label'] as String,
              onTap: () => onNavTap(item['label'] as String),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ─── Nav Item Tile ────────────────────────────────────────────
class _NavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: _pressed
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(widget.icon, size: 18, color: AppColors.primary),
              ),
            ),
            const SizedBox(width: 14),
            // Label
            Expanded(
              child: Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            // Arrow
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 13,
              color: AppColors.textMuted.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
