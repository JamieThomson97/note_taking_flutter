import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking_flutter/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:note_taking_flutter/presentation/sign_in/widgets/sign_in_form.dart';

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
          const Spacer(),
          Text("Sign in", style: Theme.of(context).textTheme.headline2),
          BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: SignInForm(),
          ),
          Column(
            children: const [
              Text("Misc buttons"),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
