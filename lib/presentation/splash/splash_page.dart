import 'package:VeloGo/application/auth/auth_bloc.dart';
import 'package:VeloGo/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {
            // ignore: avoid_print
            print("Initial state");
          },
          authenticated: (_) => {
            ExtendedNavigator.of(context).push(Routes.homePage),
          },
          unAuthenticated: (_) =>
              ExtendedNavigator.of(context).push(Routes.signInPage),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
