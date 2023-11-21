import 'package:flutter/material.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    super.key,
    required this.label,
    this.max,
    this.min,
  });

  final String label;
  final int? min;
  final int? max;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This is a required field!";
        }
        if (min != null && value.length < min!.toInt()) {
          return "Must be more than $min characters long!";
        }
        if (max != null && value.length > max!.toInt()) {
          return "Must be less than $max characters long!";
        }

        return null;
      },
    );
  }
}
