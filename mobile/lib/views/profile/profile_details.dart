import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/views/profile/edit_profile_button.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                right: 14,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer,
                border: Border.all(
                  width: 1,
                  color: theme.colorScheme.primary,
                ),
              ),
              child: Center(
                child: SvgPicture.asset("assets/profile_icon_placeholder.svg"),
              ),
            ),
            Text(
              "Volunteer’s name",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        Container(
          width: 300,
          margin: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Text(
            "About:\n///////////////////////////////////////////////////////////////////////////////////////////////////",
            style: theme.textTheme.labelLarge,
          ),
        ),
        Text(
          "Donation link: ////////////",
          style: theme.textTheme.labelLarge,
        ),
        const Spacer(),
        const EditProfileButton(),
      ],
    );
  }
}
