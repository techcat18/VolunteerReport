import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final Color forgotPasswordBtnColor = const Color(0xFF545454);

  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: forgotPasswordBtnColor,
                ),
          ),
        ),
      ),
    );
  }
}
