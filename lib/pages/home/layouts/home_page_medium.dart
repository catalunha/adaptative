import 'package:adaptative/pages/home/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../widgets/text1.dart';

class HomePageMedium extends StatelessWidget {
  const HomePageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomePageController>();
    return BlocConsumer<HomePageController, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Medium'),
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
      },
    );
  }
}
