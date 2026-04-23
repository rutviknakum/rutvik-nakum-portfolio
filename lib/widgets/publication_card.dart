import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../models/publication_model.dart';

class PublicationCard extends StatelessWidget {
  final Publication pub;
  const PublicationCard({super.key, required this.pub});

  Color get _typeColor {
    switch (pub.type) {
      case 'journal':
        return AppColors.primary;
      case 'conference':
        return AppColors.warning;
      default:
        return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: _typeColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type + Year Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: _typeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  pub.type.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: _typeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                pub.year,
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Title
          Text(
            pub.title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),

          // Journal
          Text(
            pub.journal,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: AppColors.primary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 4),

          // Authors
          Text(
            'Authors: ${pub.authors}',
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),

          // DOI Link
          InkWell(
            onTap: () => launchUrl(Uri.parse(pub.doi)),
            child: Row(
              children: [
                const Icon(Icons.link, size: 15, color: AppColors.accent),
                const SizedBox(width: 4),
                Text(
                  'View Paper',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.accent,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
