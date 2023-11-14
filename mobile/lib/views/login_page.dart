import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
            TextField(
              style: textTheme.labelMedium!.copyWith(
                color: const Color(0xFF171717),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primaryContainer,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primaryContainer,
                  ),
                ),
                labelText: "Email/Phone number",
                labelStyle: textTheme.labelMedium,
                floatingLabelStyle: textTheme.labelMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              style: textTheme.labelMedium!.copyWith(
                fontSize: 16,
                color: const Color(0xFF171717),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primaryContainer,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primaryContainer,
                  ),
                ),
                labelText: "Password",
                labelStyle: textTheme.labelMedium,
                floatingLabelStyle: textTheme.labelMedium,
              ),
            ),
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
                      color: const Color(0xFF545454),
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
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  backgroundColor: colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(17),
                ),
                child: Text(
                  "Log in",
                  style: textTheme.titleLarge!.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
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
