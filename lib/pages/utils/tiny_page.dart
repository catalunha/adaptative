import 'package:flutter/material.dart';

class TinyPage extends StatelessWidget {
  const TinyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Sua tela é menor que o mínimo necessário',
        ),
      ),
    );
  }
}
