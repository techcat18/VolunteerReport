import 'package:flutter/material.dart';
import 'package:mobile/views/login/forgot_password_button.dart';
import 'package:mobile/widgets/inputs/email_phone_field.dart';
import 'package:mobile/widgets/inputs/password_field.dart';
import 'package:mobile/widgets/submit_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const EmailPhoneField(),
          const SizedBox(
            height: 15,
          ),
          const PasswordField(),
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
