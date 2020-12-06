import 'package:dartz/dartz.dart';

import 'auth/email_address.dart';
import 'auth/failures.dart';
import 'auth/password.dart';

abstract class IAuthentication{

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(EmailAddress email, Password password);

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(EmailAddress email, Password password);

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

}