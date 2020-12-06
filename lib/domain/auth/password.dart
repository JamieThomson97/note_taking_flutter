import 'package:dartz/dartz.dart';
import 'package:note_taking_flutter/domain/auth/failures.dart';
import 'package:note_taking_flutter/domain/core/value_objects.dart';
import 'package:note_taking_flutter/domain/core/value_validators.dart';

class Password extends ValueObject<String>{

  final Either<ValueFailure<String>, String> value;
  
  factory Password(String input){
    assert (input != null);
    return Password._(
      ValueValidators.validatePassword(input)
    );
  }

  const Password._(this.value);
}