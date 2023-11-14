import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile/views/login_page.dart';

final kColorScheme = ColorScheme.fromSwatch().copyWith(
  primary: const Color(0xFF333333),
  secondary: const Color(0xFF4CAF50),
  tertiary: const Color(0xFF878787),
  error: const Color(0xFFFF3D3D),
  primaryContainer: const Color(0xFF4CAF50),
  secondaryContainer: const Color(0xFFC8F6CA),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    headlineLarge: GoogleFonts.montserrat().copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: kColorScheme.primary,
    ),
    titleLarge: GoogleFonts.montserrat().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: kColorScheme.primary,
    ),
    titleMedium: GoogleFonts.montserrat().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: kColorScheme.secondary,
    ),
    labelLarge: GoogleFonts.montserrat().copyWith(
      fontSize: 18,
      color: kColorScheme.primary,
    ),
    labelMedium: GoogleFonts.montserrat().copyWith(
      fontSize: 16,
      color: const Color(0xFF323941),
    ),
    bodyLarge: GoogleFonts.montserrat().copyWith(
      color: kColorScheme.primary,
    ),
    bodyMedium: GoogleFonts.montserrat().copyWith(
      fontSize: 15,
      color: kColorScheme.primary,
    ),
  ),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const LoginPage(),
    );
  }
}
