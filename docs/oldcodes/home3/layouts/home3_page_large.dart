import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class Home3PageLarge extends StatelessWidget {
  const Home3PageLarge({super.key});

  @override
  Widget build(BuildContext context) {
    log('Home3PageMedium.build');

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
