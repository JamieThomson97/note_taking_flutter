import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

import '../colors.dart';

Future<dynamic> getCustomFlushbar(
    BuildContext context, String title, String message) {
  return Flushbar(
    title: title,
    message: message,
    backgroundColor: buttonColor,
    borderRadius: 8,
    margin: const EdgeInsets.all(8),
    duration: const Duration(seconds: 3),
    isDismissible: true,
  ).show(context);
}
