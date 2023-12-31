import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/helpers/phone_validator.dart';
import 'package:mobile/helpers/url_validator.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/inputs/reactive_dropdown.dart';
import 'package:mobile/widgets/inputs/reactive_email_phone.dart';
import 'package:mobile/widgets/inputs/reactive_image_picker.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';
import 'package:mobile/widgets/inputs/reactive_url_field.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({super.key});

  final _form = fb.group(
    {
      "avatar": [],
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
      "link": ["", const UrlValidator()]
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
                ReactiveImagePicker(
                  name: "avatar",
                  icon: SvgPicture.asset("assets/edit.svg"),
                  placeholder: Image.asset("assets/placeholder.png"),
                  decoration: ImageContainerDecoration(
                    width: 100,
                    height: 100,
                    opacity: 0.5,
                    borderColor: theme.colorScheme.primaryContainer,
                    marginRight: 18,
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
            const ReactiveUrlField(
              name: "link",
              label: "Donation link",
            ),
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
