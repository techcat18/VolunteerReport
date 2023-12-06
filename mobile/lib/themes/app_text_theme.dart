import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/themes/app_color_scheme.dart';

final TextTheme appTextTheme = TextTheme(
  headlineLarge: GoogleFonts.montserrat(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: appColorScheme.primary,
  ),
  titleLarge: GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: appColorScheme.primary,
  ),
  titleMedium: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: appColorScheme.secondary,
  ),
  labelLarge: GoogleFonts.montserrat(
    fontSize: 18,
    color: appColorScheme.primary,
  ),
  labelMedium: GoogleFonts.montserrat(
    fontSize: 16,
    color: const Color(0xFF171717),
  ),
  bodyLarge: GoogleFonts.montserrat(
    color: appColorScheme.primary,
  ),
  bodyMedium: GoogleFonts.montserrat(
    fontSize: 15,
    color: appColorScheme.primary,
  ),
);
