import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/courses_data.dart';
import '../models/course_model.dart';
import '../widgets/section_title.dart';
import '../widgets/course_card.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

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
          const SectionTitle(title: 'Courses Taught'),
          const SizedBox(height: 32),
          FadeInUp(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 2.2 : 2.8,
              ),
              itemCount: coursesList.length,
              itemBuilder: (_, i) => CourseCard(
                course: coursesList[i],
                onTap: () => _showDetail(context, coursesList[i], isMobile),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, Course course, bool isMobile) {
    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _CourseSheet(course: course),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => _CourseDialog(course: course),
      );
    }
  }
}

// ─── Desktop Dialog ───────────────────────────────────────────
class _CourseDialog extends StatelessWidget {
  final Course course;
  const _CourseDialog({required this.course});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 580,
        constraints: const BoxConstraints(maxHeight: 700),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 40,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DialogHeader(course: course),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: _CourseBody(course: course),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Mobile Bottom Sheet ──────────────────────────────────────
class _CourseSheet extends StatelessWidget {
  final Course course;
  const _CourseSheet({required this.course});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, scrollController) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 6),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textMuted.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _SheetHeader(course: course),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                child: _CourseBody(course: course),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Dialog Header ────────────────────────────────────────────
class _DialogHeader extends StatelessWidget {
  final Course course;
  const _DialogHeader({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.menu_book_rounded,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _Pill(course.code),
                    _Pill(course.level),
                    _Pill(course.semester),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

// ─── Sheet Header ─────────────────────────────────────────────
class _SheetHeader extends StatelessWidget {
  final Course course;
  const _SheetHeader({required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.menu_book_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${course.code}  •  ${course.level}  •  ${course.semester}',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

// ─── Shared Body ──────────────────────────────────────────────
class _CourseBody extends StatelessWidget {
  final Course course;
  const _CourseBody({required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Year ──
        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 13,
              color: AppColors.textMuted,
            ),
            const SizedBox(width: 6),
            Text(
              course.year,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // ── Description ──
        if (course.description.isNotEmpty) ...[
          _label('About this Course'),
          const SizedBox(height: 10),
          Text(
            course.description,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 24),
        ],

        // ── Topics ──
        if (course.topics.isNotEmpty) ...[
          _label('Topics Covered'),
          const SizedBox(height: 12),
          ...course.topics.asMap().entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${e.key + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      e.value,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],

        // ── Study Resources ──
        _label('Study Resources'),
        const SizedBox(height: 12),

        // Google Drive
        if (course.driveUrl.isNotEmpty)
          _ResourceButton(
            icon: Icons.folder_open_rounded,
            label: 'Notes on Google Drive',
            url: course.driveUrl,
            color: AppColors.primary,
            fullWidth: true,
            filled: true,
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 15,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: 8),
                Text(
                  'Notes coming soon...',
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

        // ── GFG + InterviewBit Row ──
        if (course.gfgUrl.isNotEmpty || course.interviewBitUrl.isNotEmpty) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              if (course.gfgUrl.isNotEmpty)
                Expanded(
                  child: _ResourceButton(
                    icon: Icons.article_outlined,
                    label: 'GeeksForGeeks',
                    url: course.gfgUrl,
                    color: const Color(0xFF2F8D46),
                    fullWidth: true,
                    filled: false,
                  ),
                ),
              if (course.gfgUrl.isNotEmpty && course.interviewBitUrl.isNotEmpty)
                const SizedBox(width: 10),
              if (course.interviewBitUrl.isNotEmpty)
                Expanded(
                  child: _ResourceButton(
                    icon: Icons.psychology_outlined,
                    label: 'InterviewBit',
                    url: course.interviewBitUrl,
                    color: const Color(0xFF1A73E8), // InterviewBit Blue
                    fullWidth: true,
                    filled: false,
                  ),
                ),
            ],
          ),
        ],

        // ── YouTube Playlists ──
        if (course.youtubePlaylists.isNotEmpty) ...[
          const SizedBox(height: 16),
          _label('YouTube Playlists'),
          const SizedBox(height: 10),
          ...course.youtubePlaylists.map(
            (playlist) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _YoutubePlaylistTile(playlist: playlist),
            ),
          ),
        ],
      ],
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        letterSpacing: 0.4,
      ),
    );
  }
}

// ─── Resource Button ──────────────────────────────────────────
class _ResourceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color color;
  final bool fullWidth;
  final bool filled;

  const _ResourceButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
    this.fullWidth = false,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    void onPress() async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }

    final buttonChild = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: filled ? Colors.white : color),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: filled ? Colors.white : color,
          ),
        ),
      ],
    );

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: filled
          ? ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: buttonChild,
            )
          : OutlinedButton(
              onPressed: onPress,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: color.withValues(alpha: 0.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: color.withValues(alpha: 0.05),
              ),
              child: buttonChild,
            ),
    );
  }
}

// ─── YouTube Playlist Tile ────────────────────────────────────
class _YoutubePlaylistTile extends StatefulWidget {
  final YoutubePlaylist playlist;
  const _YoutubePlaylistTile({required this.playlist});

  @override
  State<_YoutubePlaylistTile> createState() => _YoutubePlaylistTileState();
}

class _YoutubePlaylistTileState extends State<_YoutubePlaylistTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.playlist.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFFFF0000).withValues(alpha: 0.06)
                : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? const Color(0xFFFF0000).withValues(alpha: 0.4)
                  : AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0000).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle_filled_rounded,
                    size: 18,
                    color: Color(0xFFFF0000),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.playlist.title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _hovered
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _hovered ? 1.0 : 0.35,
                child: const Icon(
                  Icons.open_in_new_rounded,
                  size: 16,
                  color: Color(0xFFFF0000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Pill Widget ──────────────────────────────────────────────
class _Pill extends StatelessWidget {
  final String text;
  const _Pill(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
