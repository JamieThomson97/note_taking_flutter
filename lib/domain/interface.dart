import 'package:dartz/dartz.dart';

import 'auth/email_address.dart';
import 'auth/failures.dart';
import 'auth/password.dart';
import 'auth/user.dart';

abstract class IAuthentication {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      EmailAddress email, Password password);

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      EmailAddress email, Password password);

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Option<User> getSignedInUser();

  Future<void> signOut();
}
