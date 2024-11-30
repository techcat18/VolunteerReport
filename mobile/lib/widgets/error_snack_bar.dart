import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  final String error;

  ErrorSnackBar({
    super.key,
    required this.error,
  }) : super(
          content: Text(
            error,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
}
