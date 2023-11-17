import 'package:flutter/material.dart';

mixin AppLoader {
  var isOpen = false;
  void showLoader(BuildContext context) async {
    if (!isOpen) {
      isOpen = true;
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Atualizando...'),
              ],
            ),
          );
        },
      );
    }
  }

  void hideLoader(BuildContext context) {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
