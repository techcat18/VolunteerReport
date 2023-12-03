import 'package:flutter/material.dart';
import 'package:mobile/helpers/text_style_extensions.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 9,
        ),
        child: Text(
          categoryName,
          style: theme.textTheme.bodyLarge!.copyWithWeight(
            FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
