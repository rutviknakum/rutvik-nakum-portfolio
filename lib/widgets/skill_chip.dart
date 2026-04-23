import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/skill_model.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;
  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: skill.level,
            backgroundColor: AppColors.surfaceAlt,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            borderRadius: BorderRadius.circular(4),
            minHeight: 4,
          ),
          const SizedBox(height: 4),
          Text(
            '${(skill.level * 100).toInt()}%',
            style: GoogleFonts.roboto(fontSize: 11, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
