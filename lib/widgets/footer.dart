import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      color: AppColors.surface,
      child: Center(
        child: Text(
          '© 2026 ${AppStrings.name} | Built with Flutter 💙',
          style: GoogleFonts.roboto(fontSize: 14, color: AppColors.textMuted),
        ),
      ),
    );
  }
}
