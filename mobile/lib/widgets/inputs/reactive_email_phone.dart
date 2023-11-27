import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveEmailPhone extends StatelessWidget {
  const ReactiveEmailPhone({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.labelMedium,
      validationMessages: {
        ValidationMessage.required: (error) => "This is a required field!",
        ValidationMessage.email: (error) =>
            "Must be a valid email or phone number!",
      },
      decoration: const InputDecoration(
        labelText: "Email/Phone number",
        hintText: "email@test.com",
      ),
    );
  }
}
