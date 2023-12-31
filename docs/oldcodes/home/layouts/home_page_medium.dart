import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/controllers.dart';
import '../controller/states.dart';
import '../widgets/text1.dart';

class HomePageMedium extends StatelessWidget {
  const HomePageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomePageMedium.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ToDo's em LMedium"),
      ),
      body: Column(children: [
        BlocBuilder<HomePageController, HomePageState>(
          builder: (context, state) {
            switch (state) {
              case HomePageStateInitial():
                return const SizedBox();
              case HomePageStateLoading():
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              case HomePageStateLoaded():
                return Center(child: Text(state.tasks.toString()));
              case HomePageStateError():
                return Center(
                  child: Text(state.error ?? ''),
                );
            }
          },
        )
      ]),
      /*
      body: BlocConsumer<HomePageController, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state) {
            case HomePageStateInitial():
              return const SizedBox();
            case HomePageStateLoading():
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case HomePageStateLoaded():
              return BlocBuilder<HomePageController, HomePageState>(
                builder: (context, state) {
                  switch (state) {
                    case HomePageStateInitial():
                      return const SizedBox();
                    case HomePageStateLoading():
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    case HomePageStateLoaded():
                      return Center(child: Text(state.tasks.toString()));
                    case HomePageStateError():
                      return Center(
                        child: Text(state.error ?? ''),
                      );
                  }
                },
              );
            // return const Center(
            //   child: Column(
            //     children: [
            //       Text1(),
            //       Text1(),
            //     ],
            //   ),
            // );
            case HomePageStateError():
              return Center(
                child: Text(state.error ?? ''),
              );
          }
        },
      ),
      */
    );
  }
}
