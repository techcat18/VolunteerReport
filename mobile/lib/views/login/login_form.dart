import 'package:flutter/material.dart';
import 'package:mobile/helpers/phone_validator.dart';
import 'package:mobile/views/login/forgot_password_button.dart';
import 'package:mobile/views/reports/reports_page.dart';
import 'package:mobile/widgets/inputs/reactive_email_phone.dart';
import 'package:mobile/widgets/inputs/reactive_password.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  void _logIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ReportsPage(),
      ),
    );
  }

  final _form = fb.group({
    'email': [
      Validators.required,
      Validators.composeOR(
        [
          Validators.email,
          const PhoneValidator(),
        ],
      )
    ],
    "password": [Validators.required],
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => _form,
      builder: (context, form, child) {
        return Column(
          children: [
            const ReactiveEmailPhone(
              name: "email",
            ),
            const SizedBox(
              height: 15,
            ),
            const ReactivePassword(
              name: "password",
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 88),
              child: const ForgotPasswordButton(),
            ),
            SubmitButton(
              text: "Log in",
              onSubmit: () => _logIn(context),
            ),
          ],
        );
      },
    );
  }
}
