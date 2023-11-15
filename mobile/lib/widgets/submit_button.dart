import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        backgroundColor: colorScheme.primaryContainer,
        padding: const EdgeInsets.all(17),
      ),
      child: Text(
        "Log in",
        style: textTheme.titleLarge!.copyWith(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
