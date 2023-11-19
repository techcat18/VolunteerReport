import 'package:flutter/material.dart';
import 'package:mobile/views/login/create_account_button.dart';
import 'package:mobile/views/login/forgot_password_button.dart';
import 'package:mobile/views/reports/reports_page.dart';
import 'package:mobile/widgets/input_field.dart';
import 'package:mobile/widgets/submit_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void logIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ReportsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(
              height: 82,
            ),
            const InputField(label: "Email/Phone number"),
            const SizedBox(
              height: 15,
            ),
            const InputField(label: "Password"),
            const SizedBox(
              height: 2,
            ),
            const ForgotPasswordButton(),
            const SizedBox(
              height: 88,
            ),
            SubmitButton(
              text: "Log in",
              onSubmit: () => logIn(context),
            ),
            const SizedBox(
              height: 8,
            ),
            const CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}
