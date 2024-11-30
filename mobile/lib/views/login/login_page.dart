import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/views/login/create_account_button.dart';
import 'package:mobile/views/login/login_form.dart';
import 'package:mobile/views/reports/reports_page.dart';
import 'package:mobile/widgets/error_snack_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnackBar(
              error: state.error,
            ),
          );
        }

        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ReportsPage(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!",
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 82, 0, 8),
                  child: LoginForm(),
                ),
                const CreateAccountButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
