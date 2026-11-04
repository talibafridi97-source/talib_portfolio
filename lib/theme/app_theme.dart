import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color brandOrange = Color(0xFFFF5722);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: accentPurple,
      surface: Color(0xFF1E293B), // Slate 800
      error: Color(0xFFEF4444),
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodyLarge: GoogleFonts.inter(
        color: const Color(0xFFCBD5E1), // Slate 300
      ),
      bodyMedium: GoogleFonts.inter(
        color: const Color(0xFF94A3B8), // Slate 400
      ),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E293B).withOpacity(0.8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withOpacity(0.08), width: 1),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8FAFC), // Slate 50
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      secondary: accentPurple,
      surface: Colors.white,
      error: Color(0xFFEF4444),
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0F172A),
      ),
      displayMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0F172A),
      ),
      displaySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0F172A),
      ),
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0F172A),
      ),
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0F172A),
      ),
      headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: const Color(0xFF0F172A),
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1E293B),
      ),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: const Color(0xFF475569),
      ),
      bodyLarge: GoogleFonts.inter(
        color: const Color(0xFF334155), // Slate 700
      ),
      bodyMedium: GoogleFonts.inter(
        color: const Color(0xFF64748B), // Slate 500
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
      ),
    ),
  );
}
