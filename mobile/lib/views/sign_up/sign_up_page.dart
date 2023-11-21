import 'package:flutter/material.dart';
import 'package:mobile/widgets/inputs/email_phone_field.dart';
import 'package:mobile/widgets/inputs/password_field.dart';
import 'package:mobile/widgets/submit_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  List<Widget> _addSpacing(List<Widget> widgets) {
    return [
      for (Widget widget in widgets) ...[
        widget,
        const SizedBox(
          height: 15,
        ),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Join us now",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 80, 32, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._addSpacing([
              const EmailPhoneField(),
              const PasswordField(),
            ]),
            const Spacer(),
            SubmitButton(
              onSubmit: () {},
              text: "Create",
            ),
          ],
        ),
      ),
    );
  }
}
