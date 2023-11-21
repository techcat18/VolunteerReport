import 'package:flutter/material.dart';

class MultilineField extends StatelessWidget {
  const MultilineField({
    this.max,
    super.key,
    this.maxLines = 2,
    required this.label,
  });

  final int? max;
  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This is a required field!";
        }
        if (max != null && value.length > max!.toInt()) {
          return "Must be less than $max characters long!";
        }

        return null;
      },
    );
  }
}
