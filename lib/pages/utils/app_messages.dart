import 'package:flutter/material.dart';

mixin AppMessages {
  void showMessageError(BuildContext context, String msg) {
    _showMessage(context, msg, Colors.red);
  }

  void showMessageInfo(BuildContext context, String msg) {
    _showMessage(context, msg, Colors.blue);
  }

  void _showMessage(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            msg,
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
        ),
      );
  }
}
