import 'package:VeloGo/application/auth/auth_bloc.dart';
import 'package:VeloGo/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return Container(
        height: height,
        child: Row(
          children: [
            Text(
              'Discover',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: 40,
              ), // TODO : Get better settings icon (DesignCode?)
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
          ],
        ),
      );
    });
  }
}
