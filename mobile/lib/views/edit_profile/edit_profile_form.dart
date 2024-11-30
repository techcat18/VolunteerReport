import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/data/organization_repository.dart';
import 'package:mobile/helpers/phone_validator.dart';
import 'package:mobile/helpers/url_validator.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/inputs/reactive_dropdown.dart';
import 'package:mobile/widgets/inputs/reactive_email_phone.dart';
import 'package:mobile/widgets/inputs/reactive_image_picker.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';
import 'package:mobile/widgets/inputs/reactive_url_field.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late User user;
  late OrganizationRepository organizationRepository;

  @override
  void initState() {
    super.initState();
    user = (context.read<UserBloc>().state as AuthSuccess).user;
    organizationRepository = context.read<OrganizationRepository>();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final form = fb.group(
      {
        "avatar": [
          user.photoPath != null ? File(user.photoPath!) : null,
          Validators.required,
        ],
        "name": [
          user.name,
          Validators.required,
        ],
        "organization": [
          user.organization.name,
          Validators.required,
        ],
        "email": [
          (user.phone == null || user.phone!.isEmpty) ? user.email : user.phone,
          Validators.required,
          Validators.composeOR(
            [
              Validators.email,
              const PhoneValidator(),
            ],
          )
        ],
        "about": [
          user.about,
          Validators.required,
        ],
        "link": [
          user.donationLink,
          Validators.required,
          const UrlValidator(),
        ],
      },
    );

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Row(
            children: [
              ReactiveImagePicker(
                name: "avatar",
                icon: SvgPicture.asset("assets/icons/edit.svg"),
                placeholder: Image.asset("assets/img/placeholder.png"),
                decoration: ImageContainerDecoration(
                  width: 100,
                  height: 100,
                  opacity: 0.5,
                  borderColor: theme.colorScheme.primaryContainer,
                  marginRight: 18,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const ReactivePlainText(
                      name: "name",
                      label: "Name",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ReactiveDropdown(
                      name: "organization",
                      label: "Organization",
                      getItems: () async {
                        final organizations =
                            await organizationRepository.getAll();
                        return organizations.map((o) => o.name).toList();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          const ReactiveEmailPhone(name: "email"),
          const SizedBox(
            height: 12,
          ),
          const ReactivePlainText(
            name: "about",
            label: "About",
            maxLines: 4,
          ),
          const SizedBox(
            height: 12,
          ),
          const ReactiveUrlField(
            name: "link",
            label: "Donation link",
          ),
          const Spacer(),
          const SizedBox(
            height: 30,
          ),
          SubmitButton(
            onSubmit: () {
              _saveChanges(form, context);
            },
            text: "Save",
          ),
        ],
      ),
    );
  }

  void _saveChanges(FormGroup form, BuildContext context) {
    if (form.valid) {
      final name = form.value['name'] as String;
      final about = form.value['about'] as String;
      final login = form.value['email'] as String;
      final organization = form.value['organization'] as String;
      final photo = (form.value['avatar'] as File).path;
      final donationLink = form.value['link'] as String;

      final isEmail = EmailValidator.emailRegex.hasMatch(login);

      context.read<UserBloc>().add(
            UserUpdateRequested(
              name: name,
              about: about,
              organization: organization,
              email: isEmail ? login : '',
              phone: isEmail ? '' : login,
              photoPath: photo,
              donationLink: donationLink,
            ),
          );
      Navigator.pop(context);
    } else {
      form.markAllAsTouched();
    }
  }
}
