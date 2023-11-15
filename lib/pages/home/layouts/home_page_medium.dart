import 'package:flutter/material.dart';

import '../widgets/text1.dart';

class HomePageMedium extends StatelessWidget {
  const HomePageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium2'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text1(),
            Text1(),
          ],
        ),
      ),
    );
  }
}
