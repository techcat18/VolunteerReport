import 'package:reactive_forms/reactive_forms.dart';

class PhoneValidator extends Validator<dynamic> {
  const PhoneValidator() : super();

  static final RegExp phoneRegex =
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return (control.isNull ||
            control.value.toString().isEmpty ||
            phoneRegex.hasMatch(control.value.toString()))
        ? null
        : {"phone": true};
  }
}
