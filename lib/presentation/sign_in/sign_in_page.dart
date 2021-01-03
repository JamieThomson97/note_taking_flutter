import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:VeloGo/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:VeloGo/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:VeloGo/presentation/styles.dart';

import '../../injection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('resources/cropped_sign_in_background.png'),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          const Spacer(flex: 3),
          const Text("Sign in",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              )),
          const Spacer(flex: 4),
          Center(
            child: BlocProvider(
              create: (context) => getIt<SignInFormBloc>(),
              child: SignInForm(),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                      onPressed: () => {},
                      child: Text(
                        "Forgot your password?",
                        style: textButtonStyle,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                      onPressed: () => {},
                      child: Text("Sign up", style: textButtonStyle)),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
