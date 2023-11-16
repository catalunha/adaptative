import 'dart:developer';

import 'package:adaptative/pages/splash/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../widgets/text1.dart';

class SplashPageMedium extends StatelessWidget {
  const SplashPageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    log('SplashPageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium'),
      ),
      body: BlocConsumer<SplashPageController, SplashPageState>(
        listener: (context, state) {
          if (state is SplashPageStateLoaded) {
            print('enviar para outra tela');
          }
        },
        builder: (context, state) {
          switch (state) {
            case SplashPageStateInitial():
              return const SizedBox();
            case SplashPageStateLoading():
              {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            case SplashPageStateLoaded():
              {
                return const Center(
                  child: Column(
                    children: [
                      Text1(),
                      Text1(),
                    ],
                  ),
                );
              }
            case SplashPageStateError():
              {
                return Center(
                  child: Text(state.error ?? ''),
                );
              }
          }
        },
      ),
    );
  }
}
