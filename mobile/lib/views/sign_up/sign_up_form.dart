import 'package:flutter/material.dart';
import 'package:mobile/widgets/inputs/dropdown_field.dart';
import 'package:mobile/widgets/inputs/email_phone_field.dart';
import 'package:mobile/widgets/inputs/multiline_field.dart';
import 'package:mobile/widgets/inputs/password_field.dart';
import 'package:mobile/widgets/inputs/plain_text_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: _addSpacing(
          [
            const PlainTextField(
              label: "Volunteer’s name",
              min: 2,
              max: 120,
            ),
            const MultilineField(
              label: "About",
              max: 300,
            ),
            const EmailPhoneField(),
            const DropDownField<String>(
              label: "Organization",
              items: [
                DropdownMenuEntry(value: "1", label: "Organization 1"),
                DropdownMenuEntry(value: "2", label: "Organization 2"),
                DropdownMenuEntry(value: "3", label: "Organization 3"),
                DropdownMenuEntry(value: "4", label: "Organization 4"),
              ],
            ),
            const PasswordField(),
            const PasswordField(),
          ],
        ),
      ),
    );
  }
}
