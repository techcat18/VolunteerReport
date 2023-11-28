import 'package:flutter/material.dart';
import 'package:mobile/helpers/phone_validator.dart';
import 'package:mobile/widgets/inputs/reactive_dropdown.dart';
import 'package:mobile/widgets/inputs/reactive_email_phone.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({super.key});

  final _form = fb.group(
    {
      "name": [Validators.required],
      "organization": [Validators.required],
      "email": [
        Validators.required,
        Validators.composeOR(
          [
            Validators.email,
            const PhoneValidator(),
          ],
        )
      ],
      "about": [Validators.required],
    },
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ReactiveFormBuilder(
      form: () => _form,
      builder: (context, formGroup, child) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    right: 18,
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      ReactivePlainText(
                        name: "name",
                        label: "Name",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ReactiveDropdown(
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
            //TODO: Donation link
            const Spacer(),
            const SizedBox(
              height: 30,
            ),
            SubmitButton(
              onSubmit: () {},
              text: "Save",
            ),
          ],
        );
      },
    );
  }
}
