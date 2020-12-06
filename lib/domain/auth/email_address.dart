import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:note_taking_flutter/domain/auth/failures.dart';
import 'package:note_taking_flutter/domain/core/value_objects.dart';
import 'package:note_taking_flutter/domain/core/value_validators.dart';

@immutable
class EmailAddress extends ValueObject<String> {

  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      ValueValidators.validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}