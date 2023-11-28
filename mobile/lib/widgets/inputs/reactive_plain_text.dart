import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactivePlainText extends StatelessWidget {
  const ReactivePlainText({
    super.key,
    this.maxLines = 1,
    required this.label,
    required this.name,
  });

  final String name;
  final int maxLines;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: label,
      ),
      validationMessages: {
        ValidationMessage.required: (error) => "This is a required field!",
        ValidationMessage.minLength: (error) =>
            "Must be less than ${(error as Map)['requiredLength']} characters long!!",
        ValidationMessage.maxLength: (error) =>
            "Must be more than ${(error as Map)['requiredLength']} characters long!!",
      },
    );
  }
}
