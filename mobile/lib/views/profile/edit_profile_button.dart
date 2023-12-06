import 'package:flutter/material.dart';
import 'package:mobile/views/edit_profile/edit_profile_page.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  void _openEditProfileView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const EditProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () => _openEditProfileView(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(
          width: 1,
          color: theme.colorScheme.primaryContainer,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 10,
        ),
      ),
      child: Row(
        children: [
          Text(
            "Edit profile",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
