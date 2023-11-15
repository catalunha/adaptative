import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class HomePageLarge extends StatelessWidget {
  const HomePageLarge({super.key});

  @override
  Widget build(BuildContext context) {
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
