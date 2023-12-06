import 'package:reactive_forms/reactive_forms.dart';

class UrlValidator extends Validator<dynamic> {
  const UrlValidator() : super();

  bool _isUrl(String input) {
    final uri = Uri.tryParse(input);

    if (uri == null || !uri.hasAbsolutePath || !uri.scheme.startsWith('http')) {
      return false;
    }

    return true;
  }

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return (control.isNull ||
            control.value.toString().isEmpty ||
            _isUrl(control.value.toString()))
        ? null
        : {"url": true};
  }
}
