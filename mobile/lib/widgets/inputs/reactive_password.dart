import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactivePassword extends StatefulWidget {
  const ReactivePassword({
    super.key,
    this.label = "Password",
    required this.name,
  });

  final String label;
  final String name;

  @override
  State<ReactivePassword> createState() => _ReactivePasswordState();
}

class _ReactivePasswordState extends State<ReactivePassword> {
  bool obscurePassword = true;

  void hideShowPassword() {
    setState(
      () => obscurePassword = !obscurePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: widget.name,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      style: Theme.of(context).textTheme.labelMedium,
      validationMessages: {
        ValidationMessage.required: (error) => "This is a required field!",
      },
      decoration: InputDecoration(
        labelText: widget.label,
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
    );
  }
}
