import 'package:flutter/material.dart';
import 'package:mobile/views/login/create_account_button.dart';
import 'package:mobile/views/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
  }
}
