import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class Home2PageLarge extends StatelessWidget {
  const Home2PageLarge({super.key});

  @override
  Widget build(BuildContext context) {
    log('Home2PageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Large'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text1(),
            Text1(),
            Text1(),
          ],
        ),
      ),
    );
  }
}
