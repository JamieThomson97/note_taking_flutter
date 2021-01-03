import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:VeloGo/domain/auth/failures.dart';
import 'package:VeloGo/domain/core/value_objects.dart';
import 'package:VeloGo/domain/core/value_validators.dart';

@immutable
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      ValueValidators.validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}
