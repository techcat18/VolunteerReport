import 'package:flutter/material.dart';

class DropDownField<T> extends StatelessWidget {
  const DropDownField({super.key, required this.label, required this.items});

  final String label;
  final List<DropdownMenuEntry<T>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enableFilter: true,
      requestFocusOnTap: true,
      label: Text(label),
      textStyle: Theme.of(context).textTheme.labelMedium,
      dropdownMenuEntries: items,
    );
  }
}
