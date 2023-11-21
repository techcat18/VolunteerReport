import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePassword = true;

  void hideShowPassword() {
    setState(
      () => obscurePassword = !obscurePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: hideShowPassword,
          icon: Icon(
            obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This is a required field!";
        }

        return null;
      },
    );
  }
}
