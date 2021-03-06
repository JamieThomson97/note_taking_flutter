import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:VeloGo/domain/auth/email_address.dart';
import 'package:VeloGo/domain/auth/failures.dart';
import 'package:VeloGo/domain/auth/password.dart';
import 'package:VeloGo/domain/interface.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthentication _authentication;

  SignInFormBloc(this._authentication) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
            emailAddress: EmailAddress(e.emailAddress), authResponse: none());
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
            password: Password(e.password), authResponse: none());
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _loginOrRegister(_authentication.registerWithEmailAndPassword);
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _loginOrRegister(_authentication.signInWithEmailAndPassword);
      },
      signInWithGooglePressed: (e) => signInWithGooglePressed(e),
      started: (_Started value) {
        return null;
      },
    );
  }

  Stream<SignInFormState> _loginOrRegister(
      Future<Either<AuthFailure, Unit>> Function(
              EmailAddress email, Password password)
          authCall) async* {
    Either<AuthFailure, Unit> authResponse;

    if (state.emailAddress.isValid() && state.password.isValid()) {
      yield state.copyWith(isSubmitting: true, authResponse: none());
      authResponse = await authCall(state.emailAddress, state.password);
    }

    yield state.copyWith(
        showErrorMessages: true,
        authResponse: optionOf(authResponse),
        isSubmitting: false);
  }

  Stream<SignInFormState> signInWithGooglePressed(
      SignInWithGooglePressed e) async* {
    yield state.copyWith(isSubmitting: true, authResponse: none());
    final failureOrSuccess = await _authentication.signInWithGoogle();
    yield state.copyWith(
        isSubmitting: false, authResponse: some(failureOrSuccess));
  }
}
