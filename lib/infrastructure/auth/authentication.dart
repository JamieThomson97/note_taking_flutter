import 'package:VeloGo/domain/auth/email_address.dart';
import 'package:VeloGo/domain/auth/failures.dart';
import 'package:VeloGo/domain/auth/password.dart';
import 'package:VeloGo/domain/auth/user.dart' as _user;
import 'package:VeloGo/domain/interface.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:VeloGo/infrastructure/auth/firebase_user_mapper.dart';

@LazySingleton(as: IAuthentication)
class Authentication implements IAuthentication {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Authentication(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      EmailAddress email, Password password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      );
      return right(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use')
        return left(const AuthFailure.emailAlreadyInUse());
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      EmailAddress email, Password password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.getOrCrash(), password: password.getOrCrash());
      return right(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found' || error.code == 'wrong-password')
        // ignore: curly_braces_in_flow_control_structures
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();

      if (user == null) return left(const AuthFailure.cancelledByUser());

      final GoogleSignInAuthentication authObject = await user.authentication;
      final OAuthCredential creds = GoogleAuthProvider.credential(
        idToken: authObject.idToken,
        accessToken: authObject.accessToken,
      );
      await _firebaseAuth.signInWithCredential(creds);
      return right(unit);
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Option<_user.User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() async => _firebaseAuth.signOut();
}
