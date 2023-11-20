import 'package:flutter/material.dart';

class EmailPhoneField extends StatelessWidget {
  const EmailPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This is a required field!";
        }

        return null;
      },
      style: Theme.of(context).textTheme.labelMedium,
      decoration: const InputDecoration(
        labelText: "Email/Phone number",
        hintText: "email@test.com",
      ),
    );
  }
}
