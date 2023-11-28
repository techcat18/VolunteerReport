import 'package:flutter/material.dart';
import 'package:mobile/views/sign_up/sign_up_form.dart';
import 'package:mobile/widgets/submit_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: SubmitButton(
          onSubmit: () {},
          text: "Create",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 80, 32, keyboardSpace),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
