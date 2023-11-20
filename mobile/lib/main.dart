import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color_scheme.dart';
import 'package:mobile/themes/app_input_theme.dart';
import 'package:mobile/themes/app_text_theme.dart';

import 'package:mobile/views/login/login_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: appColorScheme,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: AppInputTheme().theme(),
  textTheme: appTextTheme,
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
