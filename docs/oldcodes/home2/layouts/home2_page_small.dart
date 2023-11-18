import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class Home2PageSmall extends StatelessWidget {
  const Home2PageSmall({super.key});

  @override
  Widget build(BuildContext context) {
    log('Home2PageMedium.build');

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
