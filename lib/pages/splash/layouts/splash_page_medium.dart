import 'dart:developer';

import 'package:adaptative/pages/splash/controller/states.dart';
import 'package:adaptative/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';

class SplashPageMedium extends StatelessWidget {
  const SplashPageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    log('SplashPageMedium.build');

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Medium'),
      // ),
      body: BlocConsumer<SplashPageController, SplashPageState>(
        listener: (context, state) {
          if (state is SplashPageStateLoaded) {
            Navigator.of(context).pushReplacementNamed(RouteName.home);
          }
        },
        builder: (context, state) {
          switch (state) {
            case SplashPageStateInitial():
              return const SizedBox();
            case SplashPageStateLoading():
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case SplashPageStateLoaded():
              return const Center(child: Text('Carregamento finalizado.'));
            case SplashPageStateError():
              return Center(
                child: Text(state.error ?? ''),
              );
          }
        },
      ),
    );
  }
}
