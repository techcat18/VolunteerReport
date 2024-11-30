import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({
    super.key,
    required this.onAddCategory,
  });

  final void Function() onAddCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton.icon(
      onPressed: onAddCategory,
      icon: SvgPicture.asset(
        'assets/icons/add_icon.svg',
        width: 12,
        height: 12,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: Text(
        "Add category",
        style: theme.textTheme.labelMedium!.copyWith(
          color: const Color(0xFF323941),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: theme.colorScheme.primaryContainer,
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
      ),
    );
  }
}
