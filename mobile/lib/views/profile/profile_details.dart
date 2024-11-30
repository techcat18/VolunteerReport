import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/views/profile/edit_profile_button.dart';
import 'package:mobile/widgets/image_container.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = (state as AuthSuccess).user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageContainer(
                  icon: user.photoPath == null
                      ? SvgPicture.asset(
                          "assets/icons/profile_icon_placeholder.svg",
                        )
                      : null,
                  image: user.photoPath != null
                      ? Image.file(File(user.photoPath!))
                      : null,
                  decoration: ImageContainerDecoration(
                    width: 100,
                    height: 100,
                    marginRight: 14,
                    backgroundColor: theme.colorScheme.tertiaryContainer,
                    borderColor: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  user.name,
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
                "About:\n${user.about}",
                style: theme.textTheme.labelLarge,
              ),
            ),
            Text(
              "Donation link: ${user.donationLink ?? "᠆"}",
              style: theme.textTheme.labelLarge,
            ),
            const Spacer(),
            const EditProfileButton(),
          ],
        );
      },
    );
  }
}
