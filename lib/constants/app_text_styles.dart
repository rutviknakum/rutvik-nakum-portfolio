import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Hero Name
  static TextStyle heroName = GoogleFonts.poppins(
    fontSize: 52,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 1.2,
  );

  // Hero Title
  static TextStyle heroTitle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    letterSpacing: 1.5,
  );

  // Section Heading
  static TextStyle sectionHeading = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Card Title
  static TextStyle cardTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static TextStyle bodyText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  // Small / Label Text
  static TextStyle labelText = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 1.2,
  );

  // Button Text
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );
}
