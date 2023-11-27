import 'package:flutter/material.dart';
import 'package:mobile/views/sign_up/sign_up_page.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  void _createAccount(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: TextButton(
        onPressed: () => _createAccount(context),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          "Create an account",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
