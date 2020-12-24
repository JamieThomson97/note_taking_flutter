import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:note_taking_flutter/injection.dart';

import 'presentation/core/app.dart';

void main() {
  configureInjection(Environment.dev);
  runApp(MyApp());
}
