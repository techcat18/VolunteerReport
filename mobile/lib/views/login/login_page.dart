import 'package:flutter/material.dart';
import 'package:mobile/views/login/create_account_button.dart';
import 'package:mobile/views/login/forgot_password_button.dart';
import 'package:mobile/widgets/input_field.dart';
import 'package:mobile/widgets/submit_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            SizedBox(
              width: 290,
              child: SubmitButton(
                text: "Log in",
                onSubmit: () => {},
              ),
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
