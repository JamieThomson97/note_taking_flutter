import 'package:dartz/dartz.dart';
import '../auth/failures.dart';

class ValueValidators {
  static Either<ValueFailure<String>, String> validateEmailAddress(
      String input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else if (input == '' || input.isEmpty)
      return left(ValueFailure.initial(failedValue: input));
    else {
      return left(ValueFailure.invalidEmail(failedValue: input));
    }
  }

  static Either<ValueFailure<String>, String> validatePassword(String input) {
    if (input.length >= 6) {
      return right(input);
    } else if (input == '' || input.isEmpty)
      return left(ValueFailure.initial(failedValue: input));
    else {
      return left(ValueFailure.shortPassword(failedValue: input));
    }
  }
}
