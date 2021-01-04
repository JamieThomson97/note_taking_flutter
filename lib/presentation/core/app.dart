import 'package:VeloGo/application/auth/auth_bloc.dart';
import 'package:VeloGo/injection.dart';
import 'package:VeloGo/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:VeloGo/presentation/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        )
      ],
      child: MaterialApp(
        theme: theme,
        builder: ExtendedNavigator<AppRouter>(router: AppRouter()),
      ),
    );
  }
}
