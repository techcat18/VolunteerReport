import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/themes/app_color_scheme.dart';
import 'package:mobile/themes/app_text_theme.dart';

class AppInputTheme {
  final labelColor = const Color(0xFF323941);

  TextStyle _buildTextStyle(Color color) {
    return appTextTheme.labelMedium!.copyWith(color: color);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
      borderSide: BorderSide(
        color: color,
        width: 1.0,
      ),
    );
  }

  InputDecorationTheme theme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      filled: true,
      fillColor: Colors.white,
      border: _buildBorder(appColorScheme.primaryContainer),
      enabledBorder: _buildBorder(appColorScheme.primaryContainer),
      focusedBorder: _buildBorder(appColorScheme.primaryContainer),
      errorBorder: _buildBorder(appColorScheme.error),
      focusedErrorBorder: _buildBorder(appColorScheme.error),
      errorStyle: GoogleFonts.montserrat(
        fontSize: 12,
        color: appColorScheme.error,
      ),
      labelStyle: _buildTextStyle(labelColor),
      floatingLabelStyle: _buildTextStyle(labelColor),
    );
  }
}
