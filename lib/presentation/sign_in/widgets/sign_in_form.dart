import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:VeloGo/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:VeloGo/presentation/widgets/flushbar.dart';
import '../../colors.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authResponse.fold(
          () {},
          (either) => either.fold((l) {
            getCustomFlushbar(
                context,
                "failed",
                l.map(
                    cancelledByUser: (_) => 'cancelled',
                    serverError: (_) => 'server error',
                    emailAlreadyInUse: (_) => 'email already in use',
                    invalidEmailAndPasswordCombination: (_) =>
                        'invalid email / password combo'));
          }, (r) {
            getCustomFlushbar(
              context,
              "worked",
              "the action worked",
            );
          }),
        );
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'email'),
                  onChanged: (value) => {
                    if (value.isNotEmpty)
                      context
                          .read<SignInFormBloc>()
                          .add(SignInFormEvent.emailChanged(value))
                  },
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                          (l) => l.maybeMap(
                                invalidEmail: (_) => 'invalid email',
                                orElse: () => null,
                              ),
                          (_) => null),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'password'),
                  onChanged: (value) => {
                    if (value.isNotEmpty)
                      context
                          .read<SignInFormBloc>()
                          .add(SignInFormEvent.passwordChanged(value))
                  },
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                          (l) => l.maybeMap(
                                shortPassword: (_) => 'invalid password',
                                orElse: () => null,
                              ),
                          (_) => null),
                ),
                const SizedBox(height: 70),
                Center(
                  child: Row(
                    children: [
                      ButtonTheme(
                        minWidth: 150,
                        height: 60,
                        child: FlatButton(
                          onPressed: _enableButtons(context)
                              ? () {
                                  context.read<SignInFormBloc>().add(
                                        const SignInFormEvent
                                            .signInWithEmailAndPasswordPressed(),
                                      );
                                }
                              : null,
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      ButtonTheme(
                        minWidth: 150,
                        height: 60,
                        child: FlatButton(
                          onPressed: _enableButtons(context)
                              ? () {
                                  context.read<SignInFormBloc>().add(
                                        const SignInFormEvent
                                            .registerWithEmailAndPasswordPressed(),
                                      );
                                }
                              : null,
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _enableButtons(BuildContext context) {
    return context.select((SignInFormBloc bloc) =>
            bloc.state.emailAddress.value.fold((l) => false, (r) => true)) &&
        context.select((SignInFormBloc bloc) =>
            bloc.state.password.value.fold((l) => false, (r) => true));
  }
}
