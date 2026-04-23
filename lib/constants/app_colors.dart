import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF00BCD4); // Cyan
  static const Color secondary = Color(0xFF0097A7); // Dark Cyan
  static const Color accent = Color(0xFF80DEEA); // Light Cyan

  // Background Colors
  static const Color background = Color(0xFF0A0E1A); // Deep Dark Blue
  static const Color surface = Color(0xFF111827); // Card Background
  static const Color surfaceAlt = Color(0xFF1A2235); // Alternate Surface

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFB0BEC5); // Grey
  static const Color textMuted = Color(0xFF607D8B); // Muted

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);

  // Gradient
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0E1A), Color(0xFF1A2235)],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00BCD4), Color(0xFF0097A7)],
  );
}
