import 'package:flutter/material.dart';
import 'package:mobile/widgets/input_field.dart';
import 'package:mobile/widgets/submit_button.dart';

class LoginPage extends StatelessWidget {
  final Color forgotPasswordBtnColor = const Color(0xFF545454);

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

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
              style: textTheme.headlineLarge!.copyWith(
                color: colorScheme.secondary,
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
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 22,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                  ),
                  child: Text(
                    "Forgot your password?",
                    style: textTheme.bodyMedium!.copyWith(
                      color: forgotPasswordBtnColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 88,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: const SubmitButton(),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 22,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Create an account",
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
