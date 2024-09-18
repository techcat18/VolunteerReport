import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onSubmit,
    required this.text,
  });

  final String text;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return SizedBox(
      width: 290,
      child: ElevatedButton(
        onPressed: onSubmit,
        style: ElevatedButton.styleFrom(
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: colorScheme.primaryContainer,
          padding: const EdgeInsets.all(17),
        ),
        child: Text(
          text,
          style: textTheme.titleLarge!.copyWith(
            height: 1,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
