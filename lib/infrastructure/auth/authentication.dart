import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_taking_flutter/domain/auth/password.dart';
import 'package:note_taking_flutter/domain/auth/failures.dart';
import 'package:note_taking_flutter/domain/auth/email_address.dart';
import 'package:dartz/dartz.dart';
import 'package:note_taking_flutter/domain/interface.dart';

class Authentication implements IAuthentication{

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Authentication(this._firebaseAuth, this._googleSignIn);

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(EmailAddress email, Password password) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email.getOrCrash(), password: password.getOrCrash());
      return right(unit);
    } 
    on PlatformException catch (error) {
      if(error.code == 'email-already-in-use')
        return left(AuthFailure.emailAlreadyInUse());
      return left(AuthFailure.serverError());
    }
  }
  
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(EmailAddress email, Password password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email.getOrCrash(), password: password.getOrCrash());
      return right(unit);
    } 
    on PlatformException catch (error) {
      if(error.code == 'user-not-found' || error.code == 'wrong-password')
        return left(AuthFailure.invalidEmailAndPasswordCombination());
      return left(AuthFailure.serverError());
    }
  }
  
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try{
      final user = await _googleSignIn.signIn();

      if(user == null)
        return left(AuthFailure.cancelledByUser());

      GoogleSignInAuthentication authObject = await user.authentication;
      OAuthCredential creds = GoogleAuthProvider.credential(idToken: authObject.idToken, accessToken: authObject.accessToken);
      await _firebaseAuth.signInWithCredential(creds);
      return right(unit);
    } 
    on PlatformException catch (_) {
      return left(AuthFailure.serverError());
    }      
  }
}