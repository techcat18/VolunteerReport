import 'package:flutter/material.dart';
import 'package:mobile/views/login/forgot_password_button.dart';
import 'package:mobile/widgets/submit_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            style: textTheme.labelMedium,
            decoration: const InputDecoration(
              labelText: "Email/Phone number",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            style: textTheme.labelMedium,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Field is required!";
              }
              return null;
            },
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 2, 0, 88),
            child: const ForgotPasswordButton(),
          ),
          SubmitButton(
            text: "Log in",
            onSubmit: () {
              _formKey.currentState!.validate();
            },
          ),
        ],
      ),
    );
  }
}
