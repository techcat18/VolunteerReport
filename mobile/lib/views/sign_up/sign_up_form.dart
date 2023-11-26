import 'package:flutter/material.dart';
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

  final form = fb.group({
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
    "password": [Validators.required],
    "confirmPassword": [Validators.required],
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
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
            const ReactiveDropdown(
              name: "organization",
              label: "Organization",
              items: [
                "Organization 1",
                "Organization 2",
                "Organization 3",
                "Organization 4",
                "Organization 5",
              ],
            ),
            const ReactivePassword(name: "password"),
            const ReactivePassword(name: "confirmPassword"),
          ],
        ),
      ),
    );
  }
}
