import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailPhoneField extends StatelessWidget {
  const EmailPhoneField({super.key});

  bool _isEmail(String input) => EmailValidator.validate(input);
  bool _isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This is a required field!";
        }
        if (!_isEmail(value) && !_isPhone(value)) {
          return 'Must be a valid email or phone number!';
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
