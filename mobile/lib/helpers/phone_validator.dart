import 'package:reactive_forms/reactive_forms.dart';

class PhoneValidator extends Validator<dynamic> {
  const PhoneValidator() : super();

  bool _isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return _isPhone(control.value)
        ? null
        : {'phone': "Must be a valid phone number!"};
  }
}
