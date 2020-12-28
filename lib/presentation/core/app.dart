import 'package:flutter/material.dart';
import 'package:note_taking_flutter/presentation/sign_in/sign_in_page.dart';
import 'package:note_taking_flutter/presentation/styles.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const Material(child: SignInPage()),
    );
  }
}
