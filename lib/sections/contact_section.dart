import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Column(
        children: [
          // ── Top Banner ────────────────────────────
          FadeInDown(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: 52,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.06),
                border: Border(
                  top: BorderSide(color: AppColors.primary.withOpacity(0.15)),
                  bottom: BorderSide(
                    color: AppColors.primary.withOpacity(0.10),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Let's Connect",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Open to research collaborations, teaching opportunities,\n'
                    'Flutter projects, or just a conversation.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Main Content ──────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(title: 'Contact Me'),
                const SizedBox(height: 32),
                isMobile ? _mobileLayout() : _desktopLayout(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Layouts ──────────────────────────────────────────────
  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _contactForm()),
        const SizedBox(width: 48),
        Expanded(flex: 4, child: _contactSidebar()),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [_contactSidebar(), const SizedBox(height: 36), _contactForm()],
    );
  }

  // ─── Contact Form ─────────────────────────────────────────
  Widget _contactForm() {
    return FadeInLeft(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: _submitted ? _successState() : _formContent(),
      ),
    );
  }

  // ── Form Fields ─────────────────────────────────────────
  Widget _formContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a Message',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            'I usually reply within 24 hours.',
            style: GoogleFonts.roboto(fontSize: 13, color: AppColors.textMuted),
          ),
          const SizedBox(height: 28),

          // Name + Email Row
          Row(
            children: [
              Expanded(
                child: _inputField(
                  label: 'Your Name',
                  hint: 'John Doe',
                  controller: _nameController,
                  icon: Icons.person_outline_rounded,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _inputField(
                  label: 'Email Address',
                  hint: 'john@example.com',
                  controller: _emailController,
                  icon: Icons.email_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Message
          _inputField(
            label: 'Message',
            hint: 'Write your message here...',
            controller: _messageController,
            icon: Icons.chat_bubble_outline_rounded,
            maxLines: 5,
          ),
          const SizedBox(height: 28),

          // Submit Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _loading ? null : _sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send_rounded, size: 18),
                        const SizedBox(width: 10),
                        Text(
                          'Send Message',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Success State ──────────────────────────────────────
  Widget _successState() {
    return FadeInUp(
      child: SizedBox(
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.success,
                size: 36,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Message Sent!',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Thank you for reaching out.\nI will get back to you soon.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                setState(() {
                  _submitted = false;
                  _nameController.clear();
                  _emailController.clear();
                  _messageController.clear();
                });
              },
              child: Text(
                'Send another message',
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Contact Sidebar ──────────────────────────────────────
  Widget _contactSidebar() {
    return FadeInRight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info Cards
          _infoCard(
            icon: Icons.email_outlined,
            label: 'Email',
            value: AppStrings.email,
            url: 'mailto:${AppStrings.email}',
          ),
          const SizedBox(height: 12),
          _infoCard(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: AppStrings.phone,
            url: 'tel:${AppStrings.phone}',
          ),
          const SizedBox(height: 12),
          _infoCard(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: 'Vadodara, Gujarat, India',
            url: '',
          ),
          const SizedBox(height: 12),
          _infoCard(
            icon: Icons.work_outline_rounded,
            label: 'Current Role',
            value: 'Asst. Prof — ITM SLS Baroda University',
            url: '',
          ),
          const SizedBox(height: 28),

          // Divider
          Container(height: 1, color: AppColors.primary.withOpacity(0.12)),
          const SizedBox(height: 24),

          // Social Links
          Text(
            'Find me on',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _socialChip(
                icon: Icons.link,
                label: 'LinkedIn',
                url: AppStrings.linkedIn,
              ),
              const SizedBox(width: 10),
              _socialChip(
                icon: Icons.code,
                label: 'GitHub',
                url: AppStrings.github,
              ),
              const SizedBox(width: 10),
              _socialChip(
                icon: Icons.school_outlined,
                label: 'Scholar',
                url: AppStrings.googleScholar,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Availability Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.success.withOpacity(0.25)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Open to collaborations',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Info Card ────────────────────────────────────────────
  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
    required String url,
  }) {
    return InkWell(
      onTap: url.isNotEmpty ? () => launchUrl(Uri.parse(url)) : null,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primary, size: 16),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: AppColors.textMuted,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (url.isNotEmpty)
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColors.textMuted,
              ),
          ],
        ),
      ),
    );
  }

  // ─── Social Chip ──────────────────────────────────────────
  Widget _socialChip({
    required IconData icon,
    required String label,
    required String url,
  }) {
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
            Icon(icon, size: 14, color: AppColors.primary),
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

  // ─── Input Field ──────────────────────────────────────────
  Widget _inputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.roboto(fontSize: 14, color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.roboto(
              color: AppColors.textMuted,
              fontSize: 14,
            ),
            prefixIcon: maxLines == 1
                ? Icon(
                    icon,
                    color: AppColors.primary.withOpacity(0.7),
                    size: 18,
                  )
                : null,
            filled: true,
            fillColor: AppColors.surfaceAlt,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primary.withOpacity(0.12),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.error.withOpacity(0.5)),
            ),
          ),
          validator: (v) => v!.trim().isEmpty ? '$label is required' : null,
        ),
      ],
    );
  }

  // ─── Send Email ───────────────────────────────────────────
  void _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800));

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppStrings.email,
      query:
          'subject=Message from ${_nameController.text}'
          '&body=${_messageController.text}\n\nFrom: '
          '${_emailController.text}',
    );

    await launchUrl(emailUri);
    setState(() {
      _loading = false;
      _submitted = true;
    });
  }
}
