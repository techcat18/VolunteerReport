import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final inputColor = const Color(0xFF171717);

  const InputField({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return TextField(
      style: textTheme.labelMedium!.copyWith(
        color: inputColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primaryContainer,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primaryContainer,
          ),
        ),
        labelText: label,
        labelStyle: textTheme.labelMedium,
        floatingLabelStyle: textTheme.labelMedium,
      ),
    );
  }
}
