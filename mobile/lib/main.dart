import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile/views/login/login_page.dart';

final _kColorScheme = ColorScheme.fromSwatch().copyWith(
  primary: const Color(0xFF333333),
  secondary: const Color(0xFF4CAF50),
  tertiary: const Color(0xFF878787),
  error: const Color(0xFFFF3D3D),
  primaryContainer: const Color(0xFF4CAF50),
  secondaryContainer: const Color(0xFFC8F6CA),
);

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: _kColorScheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: _kColorScheme.primary,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: _kColorScheme.primary,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: _kColorScheme.secondary,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 18,
      color: _kColorScheme.primary,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 16,
      color: const Color(0xFF323941),
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: _kColorScheme.primary,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 15,
      color: _kColorScheme.primary,
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
      theme: _theme,
      home: const LoginPage(),
    );
  }
}
