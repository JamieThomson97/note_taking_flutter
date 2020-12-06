import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {

  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;

}

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}