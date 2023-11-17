import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_loader.dart';
import '../../utils/app_messages.dart';
import '../controller/controllers.dart';
import '../controller/states.dart';

class HomePageMedium2 extends StatefulWidget {
  const HomePageMedium2({super.key});

  @override
  State<HomePageMedium2> createState() => _HomePageMedium2State();
}

class _HomePageMedium2State extends State<HomePageMedium2>
    with AppLoader, AppMessages {
  @override
  Widget build(BuildContext context) {
    log('HomePageMedium2.build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ToDo's em LMedium2"),
      ),
      body: BlocListener<HomePageController, HomePageState>(
        listenWhen: (previous, current) {
          log('Listener.runtimeType ${previous.runtimeType} - ${current.runtimeType}');
          return previous.runtimeType != current.runtimeType;
        },
        listener: (context, state) async {
          log('Listener...');
          log('Listener.state ${state.runtimeType}');
          if (state is HomePageStateInitial) {
            log('Listener Initial');
          }
          if (state is HomePageStateError) {
            log('Listener Error');
            hideLoader(context);
            showMessageError(context, state.error ?? '...');
          }
          if (state is HomePageStateLoaded) {
            log('Listener Loaded');
            hideLoader(context);
          }
          if (state is HomePageStateLoading) {
            log('Listener Loading');
            showLoader(context);
          }
        },
        child: Column(
          children: [
            BlocBuilder<HomePageController, HomePageState>(
              buildWhen: (previous, current) {
                log('BlocBuilder.buildWhen ${previous.runtimeType}-${current.runtimeType}');
                return current is HomePageStateLoaded;
              },
              builder: (context, state) {
                if (state is HomePageStateLoaded) {
                  return Center(child: Text(state.tasks.toString()));
                }
                return const Center(
                  child: Text('Iniciando...'),
                );
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await context.read<HomePageController>().loading();
                },
                child: const Text('Reloading...'))
          ],
        ),

/*
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
          */
      ),
    );
  }
}
