import 'package:flutter/material.dart';
import 'package:mobile/views/sign_up/sign_up_form.dart';
import 'package:mobile/widgets/submit_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
            SignUpForm(),
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
