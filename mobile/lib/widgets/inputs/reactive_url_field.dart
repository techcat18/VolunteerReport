import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveUrlField extends StatelessWidget {
  const ReactiveUrlField({
    super.key,
    required this.name,
    required this.label,
  });

  final String name;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      keyboardType: TextInputType.url,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: label,
      ),
      validationMessages: {
        ValidationMessage.required: (error) => "This is a required field!",
        "url": (error) => "Must be an actual valid url!"
      },
    );
  }
}
