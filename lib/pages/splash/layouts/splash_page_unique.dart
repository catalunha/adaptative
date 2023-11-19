import 'dart:developer';

import 'package:adaptative/pages/splash/controller/states.dart';
import 'package:adaptative/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';

class SplashPageUnique extends StatelessWidget {
  const SplashPageUnique({super.key});

  @override
  Widget build(BuildContext context) {
    log('SplashPageUnique.build');

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Medium'),
      // ),
      body: BlocConsumer<SplashPageController, SplashPageState>(
        listener: (context, state) {
          if (state.status.isLoaded) {
            Navigator.of(context).pushReplacementNamed(RouteName.home);
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case SplashPageStateStatus.initial:
              return const SizedBox();
            case SplashPageStateStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case SplashPageStateStatus.loaded:
              return const Center(child: Text('Carregamento finalizado.'));
            case SplashPageStateStatus.error:
              return Center(
                child: Text(state.error ?? ''),
              );
          }
        },
      ),
    );
  }
}
