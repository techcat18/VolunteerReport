import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/data/organization_repository.dart';
import 'package:mobile/data/report_category_repository.dart';
import 'package:mobile/data/report_repository.dart';
import 'package:mobile/data/user_repository.dart';
import 'package:mobile/themes/app_color_scheme.dart';
import 'package:mobile/themes/app_input_theme.dart';
import 'package:mobile/themes/app_text_theme.dart';

import 'package:mobile/views/login/login_page.dart';

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: appColorScheme,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: AppInputTheme().theme(),
  textTheme: appTextTheme,
);

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => UserRepository()),
        RepositoryProvider(create: (_) => OrganizationRepository()),
        RepositoryProvider(create: (_) => ReportRepository()),
        RepositoryProvider(create: (_) => ReportCategoryRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              context.read<UserRepository>(),
              context.read<OrganizationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ReportBloc(
              context.read<ReportRepository>(),
            ),
          )
        ],
        child: const MainApp(),
      ),
    ),
  );
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
