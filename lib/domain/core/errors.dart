import 'package:note_taking_flutter/domain/auth/failures.dart';

class UnexpectedValueError extends Error{
  final ValueFailure failure;
  UnexpectedValueError(this.failure);

  @override
  String toString() {
    return Error.safeToString('Encountered a ValueFailure at an unrecoverable point. Terminating. Failure $failure');
  }
}