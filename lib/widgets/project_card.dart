import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.surfaceAlt : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.primary.withOpacity(0.15),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.project.type.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Title
            Text(
              widget.project.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              widget.project.description,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),

            // Tech Stack
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.technologies
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        tech,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Links
            Row(
              children: [
                if (widget.project.githubUrl.isNotEmpty)
                  _linkButton(Icons.code, 'GitHub', widget.project.githubUrl),
                if (widget.project.liveUrl.isNotEmpty) ...[
                  const SizedBox(width: 12),
                  _linkButton(
                    Icons.open_in_new,
                    'Live Demo',
                    widget.project.liveUrl,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _linkButton(IconData icon, String label, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
