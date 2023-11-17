import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class Home3PageSmall extends StatelessWidget {
  const Home3PageSmall({super.key});

  @override
  Widget build(BuildContext context) {
    log('Home3PageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Small'),
      ),
      body: const Column(
        children: [
          Text1(),
        ],
      ),
    );
  }
}
