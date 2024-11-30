import 'package:flutter/material.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/organization_repository.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:mobile/helpers/phone_validator.dart';

import 'package:mobile/widgets/inputs/reactive_dropdown.dart';
import 'package:mobile/widgets/inputs/reactive_email_phone.dart';
import 'package:mobile/widgets/inputs/reactive_password.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  List<Widget> _addSpacing(List<Widget> widgets) {
    return [
      for (Widget widget in widgets) ...[
        widget,
        const SizedBox(
          height: 15,
        ),
      ]
    ];
  }

  final _form = fb.group(
    {
      "name": [Validators.required],
      "about": [Validators.required],
      "email": [
        Validators.required,
        Validators.composeOR(
          [
            Validators.email,
            const PhoneValidator(),
          ],
        )
      ],
      "organization": [Validators.required],
      "password": [
        Validators.required,
        Validators.minLength(8),
      ],
      "confirmPassword": [Validators.required],
    },
    [
      Validators.mustMatch(
        "password",
        "confirmPassword",
        markAsDirty: false,
      ),
    ],
  );

  void _signUp() {
    if (_form.valid) {
      final name = _form.value['name'] as String;
      final about = _form.value['about'] as String;
      final login = _form.value['email'] as String;
      final password = _form.value['password'] as String;
      final organization = _form.value['organization'] as String;

      final isEmail = EmailValidator.emailRegex.hasMatch(login);

      context.read<UserBloc>().add(
            AuthRegisterRequested(
              name: name,
              about: about,
              password: password,
              organization: organization,
              email: isEmail ? login : '',
              phone: isEmail ? '' : login,
            ),
          );
    } else {
      _form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    final getOrganizations = context.read<OrganizationRepository>().getAll;

    return ReactiveForm(
      formGroup: _form,
      child: Column(
        children: _addSpacing(
          [
            const ReactivePlainText(
              name: "name",
              label: "Volunteer’s name",
            ),
            const ReactivePlainText(
              name: "about",
              label: "About",
            ),
            const ReactiveEmailPhone(name: "email"),
            ReactiveDropdown(
              name: "organization",
              label: "Organization",
              getItems: () async {
                final organizations = await getOrganizations();
                return organizations.map((o) => o.name).toList();
              },
            ),
            const ReactivePassword(name: "password"),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                var passwordControl = formGroup.control("password");

                if (!passwordControl.valid) {
                  return const SizedBox();
                }

                return ReactivePassword(
                  name: "confirmPassword",
                  label: "Repeat your password",
                  showErrors: (control) => control.invalid && control.dirty,
                );
              },
            ),
            const Spacer(),
            SubmitButton(
              onSubmit: () => _signUp(),
              text: "Create",
            ),
          ],
        ),
      ),
    );
  }
}
