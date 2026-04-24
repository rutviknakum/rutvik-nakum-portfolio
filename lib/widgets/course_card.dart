import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/course_model.dart';

class CourseCard extends StatefulWidget {
  final Course course;
  final VoidCallback? onTap;

  const CourseCard({super.key, required this.course, this.onTap});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _hovered = false;

  // ✅ Fix 1: PostFrameCallback — mouse tracker assertion error fix
  void _setHovered(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _hovered = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          padding: const EdgeInsets.all(16), // ✅ Fix 2: 20→16 padding reduce
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : AppColors.primary.withValues(alpha: 0.2),
              width: _hovered ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? AppColors.primary.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: _hovered ? 20 : 6,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // ✅ Fix 3: min size
            children: [
              // ── Top Row: Badge + Year ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Level Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3, // ✅ Fix 4: 4→3
                    ),
                    decoration: BoxDecoration(
                      color: widget.course.level.contains('PG')
                          ? AppColors.warning.withValues(alpha: 0.15)
                          : AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.course.level,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: widget.course.level.contains('PG')
                            ? AppColors.warning
                            : AppColors.primary,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.course.year,
                        style: GoogleFonts.roboto(
                          fontSize: 11, // ✅ Fix 5: 12→11
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(width: 6),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _hovered ? 1.0 : 0.0,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8), // ✅ Fix 6: 10→8
              // ── Course Name ──
              Text(
                widget.course.name,
                style: GoogleFonts.poppins(
                  fontSize: 14, // ✅ Fix 7: 16→14
                  fontWeight: FontWeight.w600,
                  color: _hovered ? AppColors.primary : AppColors.textPrimary,
                ),
                maxLines: 2, // ✅ Fix 8: overflow prevent
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),

              // ── Code + Semester ──
              Row(
                children: [
                  const Icon(
                    Icons.code,
                    size: 13, // ✅ Fix 9: 14→13
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.course.code,
                    style: GoogleFonts.roboto(
                      fontSize: 12, // ✅ Fix 10: 13→12
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.calendar_today,
                    size: 13,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    // ✅ Fix 11: Expanded wrap
                    child: Text(
                      widget.course.semester,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
