part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.started() = _Started;

  const factory SignInFormEvent.emailChanged(String emailAddress) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String password) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() = RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() = SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;
}