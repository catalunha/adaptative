import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class HomePageSmall extends StatelessWidget {
  const HomePageSmall({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomePageMedium.build');

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
