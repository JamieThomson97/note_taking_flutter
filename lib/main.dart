import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:note_taking_flutter/injection.dart';

import 'presentation/core/app.dart';

void main() async {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
