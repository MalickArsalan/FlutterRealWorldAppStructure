// 4.5
import 'package:formz/formz.dart';

// 4.6
class Password extends FormzInput<String, PasswordValidationError> {
  // TODO: Add the constructors.
  const Password.unvalidated([String value = '']) : super.pure(value);
  const Password.validated([String value = '']) : super.dirty(value);

  // TODO: Add the validator function.
  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 5 || value.length > 120) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum PasswordValidationError {
  empty,
  invalid,
}
